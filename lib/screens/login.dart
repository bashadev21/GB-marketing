import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/sign_up.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'forgot_password.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final AuthCon acon = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/logo.png',
                        height: Get.height * .1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CTextField(
                        controller: acon.lmobile,
                        istheme: true,
                        hint: 'Mobile Number / Email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => CTextField(
                            controller: acon.lpassword,
                            istheme: true,
                            obs: acon.lobs.value,
                            hint: 'Password',
                            ispass: true,
                            isvisible: acon.lobs.value,
                            passontap: () {
                              acon.lobs.toggle();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.to(() => ForgotPassView()),
                            child: Txt(
                              text: 'Forgot Password?',
                              color: Get.theme.primaryColor,
                              fsize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedGradientButton(
                            text: 'Login',
                            onPressed: () {
                              if (acon.lmobile.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: 'Enter Mobile or Email',
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16,
                                );
                              } else if (acon.lpassword.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: 'Enter Password',
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16,
                                );
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
                            text: 'New here? ',
                            color: Colors.grey,
                            fsize: 13,
                          ),
                          InkWell(
                            onTap: () => Get.to(() => SignupView()),
                            child: Txt(
                              text: 'Sign Up',
                              color: Get.theme.primaryColor,
                              weight: FontWeight.w500,
                              fsize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/chair.png',
                        height: Get.height * .25,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 20.sp,
                right: 20.sp,
                child: InkWell(
                  onTap: () => Get.offAll(() => BottamBar(currentindex: 0)),
                  child: Row(
                    children: [
                      Txt(
                        text: 'Skip',
                        color: Get.theme.primaryColorLight,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
