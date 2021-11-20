import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CTextField extends StatelessWidget {
  final String hint, prefix, label;
  final int max;
  final bool suffixicon;
  final bool enabled;
  final TextInputType keyboard;
  final bool isprefix;
  final bool ispreicon;
  final IconData preicon;
  final bool ispass;
  final bool isvisible;
  final TextEditingController controller;

  const CTextField(
      {Key? key,
      this.hint = '',
      this.prefix = '',
      this.enabled = true,
      this.suffixicon = false,
      this.label = '',
      this.ispass = false,
      this.isvisible = false,
      this.preicon = Icons.person,
      this.ispreicon = false,
      this.isprefix = false,
      this.max = 500,
      required this.controller,
      this.keyboard = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: ispass ? true : false,
      focusNode: enabled ? FocusNode() : AlwaysDisabledFocusNode(),
      controller: controller,
      keyboardType: keyboard,
      inputFormatters: <TextInputFormatter>[
        if (max == 10 || max == 6)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      maxLength: max,
      cursorColor: Get.theme.primaryColor,
      cursorWidth: 2,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              letterSpacing: .8)),
      decoration: InputDecoration(
        suffixIcon: ispass
            ? Icon(isvisible ? Icons.visibility_off : Icons.visibility)
            : null,
        counterText: '',
        // prefixIcon: ispreicon ? Icon(preicon) : SizedBox(),
        // : Padding(
        //     padding: EdgeInsets.all(isprefix ? 15.sp : 0),
        //     child: Text(prefix,
        //         style: GoogleFonts.poppins(
        //             textStyle: TextStyle(
        //                 fontSize: 14.sp,
        //                 fontWeight: FontWeight.w500,
        //                 color: Colors.black87,
        //                 letterSpacing: .8))),
        //   ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        contentPadding: EdgeInsets.all(14.sp),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
