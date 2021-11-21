import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base_client.dart';

class AuthCon extends GetxController with BaseController {
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
}
