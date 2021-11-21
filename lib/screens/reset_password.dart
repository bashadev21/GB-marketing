import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ResetPassView extends StatelessWidget {
  ResetPassView({Key? key}) : super(key: key);
  final TextEditingController newpasscon = new TextEditingController();
  final TextEditingController confirmpasscon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Change Password',
        carticon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CTextField(
              controller: confirmpasscon,
              hint: 'New Password',
              ispass: true,
            ),
            SizedBox(
              height: 30,
            ),
            CTextField(
              controller: confirmpasscon,
              hint: 'Confirm Password',
              ispass: true,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * .7,
                  child: RaisedGradientButton(
                      text: 'Confirm',
                      onPressed: () {
                        print('button clicked');
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}