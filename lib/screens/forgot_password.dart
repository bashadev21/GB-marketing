import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'reset_password.dart';

class ForgotPassView extends StatelessWidget {
  ForgotPassView({Key? key}) : super(key: key);
  final TextEditingController c1 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Forgot Password',
        carticon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Txt(
              text: 'Enter the Phone Number associated with your account',
              weight: FontWeight.w500,
              color: Colors.grey,
              iscenter: true,
            ),
            SizedBox(
              height: 20,
            ),
            CTextField(
              controller: c1,
              keyboard: TextInputType.number,
              max: 10,
              hint: 'Phone',
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedGradientButton(
                  text: 'Reset Password',
                  onPressed: () {
                    Get.to(() => ResetPassView());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
