import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
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
                  width: 20,
                ),
                Txt(
                  text: 'Search Products',
                  fsize: 10,
                  color: Colors.grey,
                )
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
