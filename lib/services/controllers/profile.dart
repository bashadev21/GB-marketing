import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/login.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:get_storage/get_storage.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class ProfileCon extends GetxController with BaseController {
  var favlist = [].obs;
  var addresslist = [].obs;
  var myorderslist = [].obs;
  var uniorderslist = [].obs;

  final TextEditingController aname = new TextEditingController();
  final TextEditingController adoor = new TextEditingController();
  final TextEditingController astreet = new TextEditingController();
  final TextEditingController aland = new TextEditingController();
  final TextEditingController acity = new TextEditingController();
  final TextEditingController apincode = new TextEditingController();
  final TextEditingController astate = new TextEditingController();
  final TextEditingController amobile = new TextEditingController();

  final TextEditingController coldpass = new TextEditingController();
  final TextEditingController cnewpass = new TextEditingController();
  final TextEditingController cnewcpass = new TextEditingController();
  var oobs = true.obs;
  var nobs = true.obs;
  var ncobs = true.obs;

  @override
  void onInit() {
    if (GetStorage().read('userid').toString() != 'null') {
      getfavlist();
      getaddress();
      myorders();
    }

    super.onInit();
  }

  void getfavlist() async {
    var body = {
      'functocall': API().getfavlist,
      'user_id': GetStorage().read('userid').toString()
    };

    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      favlist.value = data;
    }
  }

  void getaddress() async {
    var body = {
      'functocall': API().getadresslist,
      'user_id': GetStorage().read('userid').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());

    if (response != '[]' || response != '') {
      hideLoading();
      var data = json.decode(response);
      addresslist.value = data;
    }
  }

  void uniorder(orderid) async {
    var body = {'functocall': API().uniqorder, 'order_id': orderid};
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());

    if (response != '[]' || response != '') {
      hideLoading();
      var data = json.decode(response);
      uniorderslist.value = data;
    }
  }

  void ratingreview(productid, rate, review, orderid,
      {reviewbool = false}) async {
    if (reviewbool) showLoading();
    var body = {
      'functocall': API().ratereview,
      'product_id': productid,
      'rating': rate,
      'review': review,
      'user_id': GetStorage().read('userid').toString()
    };
    print(body);
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    var data = json.decode(response);
    hideLoading();
    if (Get.isDialogOpen!) Get.back();

    Fluttertoast.showToast(
      msg: reviewbool ? data[0]['review'] : data[0]['rating'],
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
    uniorder(orderid);
  }

  void cancelorder(status, canproid, productid, orderid, price, qty) async {
    showLoading();
    var body = {
      'functocall': API().cancelorder,
      'page': status,
      'order_id': orderid.toString(),
      'pro_odr_price': price.toString(),
      'cancel_pro_id': canproid.toString(),
      'product_id': productid.toString(),
      'pro_odr_quantity': qty.toString(),
      'user_id': GetStorage().read('userid').toString()
    };
    print(body);
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    // var data = json.decode(response);
    hideLoading();
    if (Get.isDialogOpen!) Get.back();

    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
    uniorder(orderid);
  }

  void updatepassword({isforgot = false, mobile = '', password}) async {
    showLoading();
    var body = {
      'functocall': API().updatepassword,
      'user_id': isforgot ? mobile : GetStorage().read('userid').toString(),
      'old_password': isforgot ? '0' : coldpass.text,
      'new_password': isforgot ? password : cnewpass.text,
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    hideLoading();
    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
    if (response == 'Password Updated') {
      coldpass.clear();
      cnewcpass.clear();
      cnewpass.clear();
      Get.back();
    }
    if (response == 'New Password Is Set!') {
      final AuthCon acon = Get.find();
      acon.fphone.clear();
      Get.offAll(() => LoginView());
    }
  }

  void addaddress() async {
    showLoading();
    var body = {
      'functocall': API().addadresslist,
      'user_id': GetStorage().read('userid').toString(),
      'fullname': aname.text,
      'door_no': adoor.text,
      'street': astreet.text,
      'landmark': aland.text,
      'city': acity.text,
      'state': astate.text,
      'mobile_no': amobile.text,
      'pincode': apincode.text,
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response == 'Address Added Successfully!') {
      hideLoading();
      getaddress();
      aname.clear();
      adoor.clear();
      astreet.clear();
      aland.clear();
      acity.clear();
      astate.clear();
      amobile.clear();
      apincode.clear();
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      final CartCon ccon = Get.find();
      ccon.checkoutaddres();
      Get.back();
    } else {
      hideLoading();
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void updateaddress(adid) async {
    showLoading();
    print(adid);
    var body = {
      'functocall': API().updateadress,
      'user_id': GetStorage().read('userid').toString(),
      'fullname': aname.text,
      'useraddress_id': adid,
      'door_no': adoor.text,
      'street': astreet.text,
      'landmark': aland.text,
      'city': acity.text,
      'state': astate.text,
      'mobile_no': amobile.text,
      'pincode': apincode.text,
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response == 'Address Updated!') {
      hideLoading();
      getaddress();
      aname.clear();
      adoor.clear();
      astreet.clear();
      aland.clear();
      acity.clear();
      astate.clear();
      amobile.clear();
      apincode.clear();
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Get.back();
    } else {
      hideLoading();
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void deleteaddress(addressid) async {
    var body = {
      'functocall': API().deleteaddress,
      'user_id': GetStorage().read('userid').toString(),
      'useraddress_id': addressid,
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    Get.back();
    getaddress();
    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  void myorders() async {
    var body = {
      'functocall': API().myorders,
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      myorderslist.value = data;
    }
  }
}
