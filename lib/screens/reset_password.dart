import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
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
                  child: RaisedGradientButton(
                      text: 'Confirm',
                      onPressed: () {
                        if (acon.rconfirmpassword.text.isEmpty ||
                            acon.rpassword.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'Fields Required',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        } else if (acon.rpassword.text.length < 5) {
                          Fluttertoast.showToast(
                            msg: 'Password should above 5 charaters',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        } else if (acon.rconfirmpassword.text !=
                            acon.rpassword.text) {
                          Fluttertoast.showToast(
                            msg: 'Password Not Matched',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        } else {
                          final ProfileCon pcon = Get.find();
                          pcon.updatepassword(
                              isforgot: true,
                              mobile: acon.fphone.text,
                              password: acon.rpassword.text);
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
