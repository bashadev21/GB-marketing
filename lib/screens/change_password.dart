import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChangePassView extends StatelessWidget {
  ChangePassView({Key? key}) : super(key: key);
  final ProfileCon pcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        backicon: true,
        title: 'Change Password',
        carticon: true,
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
                controller: pcon.coldpass,
                hint: 'Old Password',
                ispass: true,
                obs: pcon.oobs.value,
                isvisible: pcon.oobs.value,
                passontap: () {
                  pcon.oobs.toggle();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => CTextField(
                controller: pcon.cnewpass,
                hint: 'New Password',
                ispass: true,
                obs: pcon.nobs.value,
                isvisible: pcon.nobs.value,
                passontap: () {
                  pcon.nobs.toggle();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => CTextField(
                controller: pcon.cnewcpass,
                hint: 'Confirm Password',
                ispass: true,
                obs: pcon.ncobs.value,
                isvisible: pcon.ncobs.value,
                passontap: () {
                  pcon.ncobs.toggle();
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
                  child: RaisedGradientButton(
                      text: 'Confirm',
                      onPressed: () {
                        if (pcon.coldpass.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'Old Password Required',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else if (pcon.cnewpass.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'New Password Required',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else if (pcon.cnewcpass.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'Confirm Password Required',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else if (pcon.cnewpass.text.length < 5) {
                          Fluttertoast.showToast(
                            msg: 'Password should above 5 characters',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else if (pcon.cnewcpass.text != pcon.cnewpass.text) {
                          Fluttertoast.showToast(
                            msg: 'Password Not Matched',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else {
                          pcon.updatepassword();
                        }
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
