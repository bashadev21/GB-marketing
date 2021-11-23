import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class HomeCon extends GetxController with BaseController {
  var bannerlist = [].obs;
  var popcategotylist = [].obs;
  var popproductlist = [].obs;
  var catproductlist = [].obs;
  var productdetials = {}.obs;
  var load = false.obs;
  @override
  void onInit() {
    getbanner();
    getpopcat();
    getpopprodcts();
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

  void getpopcatprod(catid) async {
    print(catid);
    var body = {
      'functocall': API().getpopprod,
      'categoryid': catid,
      'user_id': GetStorage().read('userid')
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

  void getproddetails(prodid) async {
    load.value = true;
    print(prodid);
    var body = {
      'functocall': API().getproddetails,
      'product_id': prodid,
      'user_id': GetStorage().read('userid')
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
