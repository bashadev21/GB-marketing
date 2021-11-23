import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ResetPassView extends StatelessWidget {
  ResetPassView({Key? key}) : super(key: key);
  final AuthCon acon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: false,
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
            Obx(
              () => CTextField(
                controller: acon.rpassword,
                hint: 'New Password',
                ispass: true,
                obs: acon.robs.value,
                isvisible: acon.lobs.value,
                passontap: () {
                  acon.robs.toggle();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => CTextField(
                controller: acon.rconfirmpassword,
                hint: 'Confirm Password',
                ispass: true,
                obs: acon.rcobs.value,
                isvisible: acon.lobs.value,
                passontap: () {
                  acon.rcobs.toggle();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * .7,
                  child:
                      RaisedGradientButton(text: 'Confirm', onPressed: () {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
