import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/api_endpoints.dart';
import 'package:gb_marketing/screens/otp.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../base_client.dart';

class AuthCon extends GetxController with BaseController {
  var otp = ''.obs;

  ///login
  final TextEditingController lmobile = new TextEditingController();
  final TextEditingController lpassword = new TextEditingController();
  var lobs = true.obs;

  ///signup
  final TextEditingController sfirstname = new TextEditingController();
  final TextEditingController slastname = new TextEditingController();
  final TextEditingController sphone = new TextEditingController();
  final TextEditingController semail = new TextEditingController();
  final TextEditingController spassword = new TextEditingController();
  final TextEditingController sconfirmpassword = new TextEditingController();
  var sobs = true.obs;
  var scobs = true.obs;

  ///forgotpass
  final TextEditingController fphone = new TextEditingController();

  ///resetpass
  final TextEditingController rpassword = new TextEditingController();
  final TextEditingController rconfirmpassword = new TextEditingController();
  var robs = true.obs;
  var rcobs = true.obs;

  void login() async {
    showLoading();

    var body = {
      'functocall': API().login,
      'mobileno': lmobile.text.trim(),
      'password': lpassword.text,
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    hideLoading();
    if (response == 'Please Register' || response == 'Invalid Credentials') {
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      lmobile.clear();
      lpassword.clear();
      var data = json.decode(response);
      GetStorage().write('userid', data[0]['userid']);
      print(GetStorage().read('userid').toString());
      Get.offAll(() => BottamBar(currentindex: 0));
    }
  }

  void forgotpass() async {
    showLoading();

    var body = {
      'functocall': API().fortgotpass,
      'mobileno': fphone.text.trim(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    hideLoading();
    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.black87,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
    );
    if (response.toString().length == 6) {
      otp.value = response.toString();
      Get.to(() => OtpView(
            issign: true,
            mobile: fphone.text,
          ));
    }
  }

  void signup() async {
    showLoading();

    var body = {
      'functocall': API().signup,
      'firstname': sfirstname.text.trim(),
      'lastname': slastname.text.trim(),
      'mobileno': sphone.text.trim(),
      'email': semail.text.trim(),
      'password': spassword.text.trim(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    hideLoading();
    if (response == 'email already exists' ||
        response == 'mobile number already exists') {
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } else {
      sfirstname.clear();
      slastname.clear();
      spassword.clear();
      sconfirmpassword.clear();
      sphone.clear();
      semail.clear();

      var data = json.decode(response);
      GetStorage().write('userid', data[0]['userid']);
      print(GetStorage().read('userid').toString());
      Get.to(() => BottamBar(
            currentindex: 0,
          ));
    }
  }

  void generateotp() async {
    showLoading();

    var body = {
      'functocall': API().otp,
      'mobileno': sphone.text.trim(),
      'email': semail.text.trim(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    hideLoading();
    if (response.toString().length == 6) {
      otp.value = response.toString();
      Fluttertoast.showToast(
        msg: response,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Get.to(() => OtpView(
            mobile: sphone.text,
          ));
    } else {
      Fluttertoast.showToast(
        msg: response,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void resetpassword() async {
    showLoading();

    var body = {
      'functocall': API().fortgotpass,
      'mobileno': fphone.text.trim(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    hideLoading();
    Fluttertoast.showToast(
      msg: response,
      backgroundColor: Colors.black87,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
    );
    if (response.toString().length == 6) {
      otp.value = response.toString();
      Get.to(() => OtpView(
            issign: true,
            mobile: fphone.text,
          ));
    }
  }
}
