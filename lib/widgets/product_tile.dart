import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductTile extends StatelessWidget {
  final bool isfav;
  const ProductTile({Key? key, this.isfav = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Expanded(child: Placeholder()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              text: 'Glass cofee table',
                              fsize: 12,
                              weight: FontWeight.w500,
                              lines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Txt(
                                  text: 'Save ₹123',
                                  fsize: 11,
                                  color: Colors.grey,
                                  lines: 2,
                                ),
                                Txt(
                                  text: ' (15% OFF)',
                                  fsize: 10,
                                  color: Colors.red,
                                  weight: FontWeight.w500,
                                  lines: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Txt(
                                      text: 'M.R.P. ',
                                      fsize: 11,
                                      color: Colors.pink,
                                      lines: 2,
                                    ),
                                    Text(
                                      '₹123',
                                      style: TextStyle(
                                          color: Colors.pink,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 12.sp,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Txt(
                                      text: '3',
                                      fsize: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Txt(
                                      text: '₹ 1233',
                                      fsize: 14,
                                      color: Colors.pink,
                                      weight: FontWeight.w500,
                                      lines: 2,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Get.theme.primaryColorLight,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              child: Icon(
                isfav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                color: Colors.red,
              ),
              radius: 15.sp,
              backgroundColor: Colors.grey.withOpacity(0.8),
            ))
      ],
    );
  }
}
