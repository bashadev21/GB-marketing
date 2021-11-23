import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class ProfileCon extends GetxController with BaseController {
  var favlist = [].obs;
  var addresslist = [].obs;

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

  @override
  void onInit() {
    getfavlist();
    getaddress();
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
      var data = json.decode(response);
      addresslist.value = data;
    }
  }

  void addaddress() async {
    showLoading();
    var body = {
      'functocall': API().addadresslist,
      'user_id': GetStorage().read('userid'),
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
      'user_id': GetStorage().read('userid'),
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
      'user_id': GetStorage().read('userid'),
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
}
