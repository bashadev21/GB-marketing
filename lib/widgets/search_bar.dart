import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Get.theme.primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 10),
          child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            letterSpacing: .8)),
                    hintText: 'Search Products',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  cursorColor: Get.theme.primaryColor,
                  cursorWidth: 2,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          letterSpacing: .8)),
                ))
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            height: 55,
          ),
        ),
      ),
    );
  }
}
