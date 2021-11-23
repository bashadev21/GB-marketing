import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'reset_password.dart';

class ForgotPassView extends StatelessWidget {
  ForgotPassView({Key? key}) : super(key: key);
  final AuthCon acon = Get.find();

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
              controller: acon.fphone,
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
                    if (acon.fphone.text.length != 10) {
                      Fluttertoast.showToast(
                        msg: 'Enter Valid Mobile',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      acon.forgotpass();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
