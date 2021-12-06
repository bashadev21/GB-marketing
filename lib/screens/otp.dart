import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/reset_password.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sizer/sizer.dart';

class OtpView extends StatelessWidget {
  final bool issign;
  final String mobile;
  OtpView({Key? key, this.issign = false, this.mobile = ''}) : super(key: key);

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Get.theme.primaryColor),
      borderRadius: BorderRadius.circular(15.0.sp),
    );
  }

  final TextEditingController otp = TextEditingController();
  final AuthCon acon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        backicon: true,
        title: 'OTP Verification',
        carticon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Txt(
                  text: 'Enter the OTP Send to ',
                  weight: FontWeight.normal,
                  fsize: 13,
                  color: Colors.grey,
                ),
                Txt(
                  text: mobile,
                  weight: FontWeight.bold,
                  fsize: 13,
                ),
              ],
            ),
            SizedBox(
              height: 15.sp,
            ),
            PinPut(
                controller: otp,
                onChanged: (o) {},
                eachFieldPadding: const EdgeInsets.all(10),
                eachFieldHeight: 50,
                eachFieldWidth: 30,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                textStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: .8)),
                followingFieldDecoration: BoxDecoration(
                  border: Border.all(color: Get.theme.primaryColor),
                  borderRadius: BorderRadius.circular(3.0.sp),
                ),
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(100.0.sp),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                fieldsCount: 6),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Txt(
                      text: 'Didn\'t Receive OTP?  ',
                      color: Colors.grey,
                      fsize: 12,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => acon.generateotp(),
                  child: Txt(
                    text: 'RESEND OTP',
                    weight: FontWeight.bold,
                    color: Get.theme.primaryColorLight,
                    fsize: 13,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: RaisedGradientButton(
                  onPressed: () {
                    if (otp.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Enter OTP',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 18,
                      );
                    } else if (otp.text.length != 6) {
                      Fluttertoast.showToast(
                        msg: 'Enter Valid OTP',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 18,
                      );
                    } else {
                      print(otp.text);
                      if (acon.otp.value != otp.text.toString()) {
                        Fluttertoast.showToast(
                          msg: 'Enter Valid OTP',
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 18,
                        );
                      } else {
                        if (issign == false) {
                          acon.signup();
                        } else {
                          Get.offAll(() => ResetPassView());
                        }
                      }
                    }
                    // if (mobile.text.isEmpty) {
                    //   Fluttertoast.showToast(
                    //     msg: 'Enter Mobile Number',
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 18,
                    //   );
                    // } else if (mobile.text.length != 10) {
                    //   Fluttertoast.showToast(
                    //     msg: 'Enter Valid Mobile Number',
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 18,
                    //   );
                    // }
                  },
                  text: 'Verify & Proceed',
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
