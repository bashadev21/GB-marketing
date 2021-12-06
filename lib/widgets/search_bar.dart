import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/home.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  final bool showclear;
  final ValueChanged onsubmit;
  final TextEditingController con;
  final ValueChanged onchange;
  SearchBar(
      {Key? key,
      required this.showclear,
      required this.onsubmit,
      required this.con,
      required this.onchange})
      : super(key: key);
  final HomeCon hcon = Get.find();
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
                InkWell(
                  onTap: () {
                    print(hcon.showclear.value);
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  controller: con,
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
                    suffixIcon: showclear
                        ? InkWell(
                            onTap: () {
                              con.clear();
                              hcon.showclear.value = false;
                            },
                            child: Icon(Icons.cancel,
                                color: Get.theme.primaryColor))
                        : SizedBox(),
                  ),
                  cursorColor: Get.theme.primaryColor,
                  cursorWidth: 2,
                  onChanged: onchange,
                  onSubmitted: onsubmit,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
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
