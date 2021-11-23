import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'otp.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);
  final AuthCon acon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Sign Up',
        carticon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            CTextField(
              controller: acon.sfirstname,
              hint: 'First Name',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: acon.slastname,
              hint: 'Last Name',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: acon.sphone,
              keyboard: TextInputType.number,
              max: 10,
              hint: 'Phone',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: acon.semail,
              keyboard: TextInputType.emailAddress,
              hint: 'Email',
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => CTextField(
                controller: acon.spassword,
                ispass: true,
                isvisible: acon.sobs.value,
                obs: acon.sobs.value,
                passontap: () {
                  acon.sobs.toggle();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                hint: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => CTextField(
                controller: acon.sconfirmpassword,
                ispass: true,
                isvisible: acon.scobs.value,
                obs: acon.scobs.value,
                passontap: () {
                  acon.scobs.toggle();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                hint: 'Confirm Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedGradientButton(
                  text: 'Continue',
                  onPressed: () {
                    if (acon.sfirstname.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'First Name Required',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.slastname.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Last Name Required',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.sphone.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Mobile Number Required',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.semail.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Email Required',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.spassword.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Password Required',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.sconfirmpassword.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Confirm Password Required',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.sphone.text.length != 10) {
                      Fluttertoast.showToast(
                        msg: 'Enter Valid Mobile Number',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.spassword.text.length < 5) {
                      Fluttertoast.showToast(
                        msg: 'Password should be above 5 characters',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (!acon.semail.text.trim().toString().isEmail) {
                      Fluttertoast.showToast(
                        msg: 'Enter Valid Email',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else if (acon.spassword.text !=
                        acon.sconfirmpassword.text) {
                      Fluttertoast.showToast(
                        msg: 'Password Not Matched',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else {
                      acon.generateotp();
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Txt(
                  text: 'Already have an account? ',
                  color: Colors.grey,
                  fsize: 13,
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Txt(
                    text: 'Login',
                    color: Get.theme.primaryColor,
                    weight: FontWeight.w500,
                    fsize: 13,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
