import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'otp.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);
  final TextEditingController c1 = new TextEditingController();
  final TextEditingController c2 = new TextEditingController();
  final TextEditingController c3 = new TextEditingController();
  final TextEditingController c4 = new TextEditingController();
  final TextEditingController c5 = new TextEditingController();
  final TextEditingController c6 = new TextEditingController();
  final TextEditingController c7 = new TextEditingController();
  final TextEditingController c8 = new TextEditingController();
  final TextEditingController c9 = new TextEditingController();
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
              controller: c1,
              hint: 'First Name',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: c2,
              hint: 'Last Name',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: c3,
              keyboard: TextInputType.number,
              max: 10,
              hint: 'Phone',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: c4,
              keyboard: TextInputType.emailAddress,
              hint: 'Email',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: c6,
              ispass: true,
              hint: 'Password',
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: c5,
              ispass: true,
              hint: 'Confirm Password',
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedGradientButton(
                  text: 'Continue', onPressed: () => Get.to(() => OtpView())),
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
