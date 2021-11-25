import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class CartCon extends GetxController with BaseController {
  var cartlist = [].obs;
  var checklist = [].obs;
  var totalamount = ''.obs;
  var name = '0'.obs;
  var door = '0'.obs;
  var street = '0'.obs;
  var city = '0'.obs;
  var land = '0'.obs;
  var state = '0'.obs;
  var mobile = '0'.obs;
  var shipping = '0'.obs;
  var days = '0'.obs;
  var msg = '0'.obs;
  var pincode = '0'.obs;
  var addressid = '0'.obs;
  var onlinepay = false.obs;
  var codpay = false.obs;

  @override
  void onInit() {
    if (GetStorage().read('userid').toString() != 'null') {
      getcartlist();
      checkoutaddres();
    }

    super.onInit();
  }

  void getcartlist() async {
    var body = {
      'functocall': API().getcartlist,
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      cartlist.value = data;
    }
  }

  void checkoutaddres() async {
    var body = {
      'functocall': API().checkoutaddress,
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      checklist.value = data;
      shipping.value = checklist[0]['charge_and_days'][0]['charge'];
      name.value = checklist[0]['fullname'];
      door.value = checklist[0]['doorno'];
      mobile.value = checklist[0]['mobile_no'];
      street.value = checklist[0]['street'];
      pincode.value = checklist[0]['pincode'];
      state.value = checklist[0]['state'];
      city.value = checklist[0]['city'];
      land.value = checklist[0]['landmark'];
      addressid.value = checklist[0]['useraddress_id'];
      msg.value = checklist[0]['charge_and_days'][0]['msg'];
      days.value = checklist[0]['charge_and_days'][0]['days'];
    }
  }
}
