import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:get_storage/get_storage.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class HomeCon extends GetxController with BaseController {
  var bannerlist = [].obs;
  var popcategotylist = [].obs;
  var popproductlist = [].obs;
  var catproductlist = [].obs;
  var recentproductlist = [].obs;
  var searchlist = [].obs;
  var productdetials = {}.obs;
  var load = false.obs;
  var showclear = false.obs;
  var itemcount = 1.obs;
  var delcheck = 'check'.obs;
  var selectedPageIndex = 0.obs;

  final TextEditingController qty = new TextEditingController();
  final TextEditingController searchc = new TextEditingController();
  final TextEditingController pincode = new TextEditingController();
  void increment() {
    if (itemcount.value != 10) itemcount.value++;
    print(itemcount.value.toString());
  }

  void decrement() {
    if (itemcount.value != 1) itemcount.value--;
    print(itemcount.value.toString());
  }

  @override
  void onInit() {
    getbanner();
    getpopcat();
    getpopprodcts();
    if (GetStorage().read('userid').toString() != 'null') {
      getrecentlyadd();
    }

    super.onInit();
  }

  void getbanner() async {
    var response = await BaseClient().get(API().banner).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    bannerlist.value = data;
    print(bannerlist);
  }

  void getpopcat() async {
    var response =
        await BaseClient().get(API().getpopcat).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    popcategotylist.value = data;
    print(popcategotylist);
  }

  void getpopprodcts() async {
    var response =
        await BaseClient().get(API().getpopproducts).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    popproductlist.value = data;
    print(popproductlist);
  }

  void deliverycheck() async {
    var body = {
      'functocall': API().pincheck,
      'pincode': pincode.text.toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    delcheck.value = data[0]['msg'];
  }

  void getpopcatprod(catid, {paramn = 'categoryid'}) async {
    print(catid);
    var body = {
      'functocall': API().getpopprod,
      paramn: catid,
      'user_id': GetStorage().read('userid').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      catproductlist.value = data;
    }
  }

  void productadd(prodid, qty) async {
    print(prodid);
    var body = {
      'functocall': API().addproducts,
      'product_id': prodid,
      'user_id': GetStorage().read('userid').toString(),
      'quantity': qty.toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    final CartCon con = Get.find();

    print(response.toString());
    var data = json.decode(response);
    con.getcartlist();
    Fluttertoast.showToast(
      msg: data[0]['msg'],
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  void productdelete(tempid) async {
    print(tempid);
    var body = {
      'functocall': API().deleteprod,
      'temp_id': tempid,
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    final CartCon con = Get.find();

    print(response.toString());
    var data = json.decode(response);
    con.getcartlist();
    Fluttertoast.showToast(
      msg: data['msg'],
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  void getrecentlyadd() async {
    var body = {
      'functocall': API().getrecentlyadd,
      'user_id': GetStorage().read('userid').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      recentproductlist.value = data;
    }
  }

  void serachprod() async {
    var body = {'functocall': API().searchkey, 'keyword': searchc.text};
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      searchlist.value = data;
    }
  }

  void serachprodview(searchname) async {
    var body = {
      'functocall': API().searchproducts,
      'search_product': searchname,
      'user_id': GetStorage().read('userid').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      catproductlist.value = data;
    }
  }

  void favaddremove(prodid) async {
    final ProfileCon pcon = Get.find();
    print(prodid);
    var body = {
      'functocall': API().addremovefav,
      'product_id': prodid,
      'user_id': GetStorage().read('userid').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
    pcon.getfavlist();
    print(response.toString());
  }

  void getproddetails(prodid) async {
    load.value = true;
    print(prodid);
    var body = {
      'functocall': API().getproddetails,
      'product_id': prodid,
      'user_id': GetStorage().read('userid').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    load.value = false;

    print(response.toString());
    if (response != '[]' || response != '') {
      load.value = false;
      var data = json.decode(response);
      productdetials.value = data[0];
      print(productdetials.toString());
    }
  }
}
