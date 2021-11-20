import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';

import 'order_detail.dart';

class MyOrdersView extends StatefulWidget {
  MyOrdersView({Key? key}) : super(key: key);

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'My Orders',
        carticon: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Get.to(() => OrderDetails()),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Txt(
                          text: 'Order ID : ',
                          color: Colors.grey,
                          fsize: 12,
                        ),
                        Txt(
                          text: '1234567',
                          weight: FontWeight.w500,
                          fsize: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.sp,
                    ),
                    Row(
                      children: [
                        Txt(
                          text: 'Ordered on : ',
                          color: Colors.grey,
                          fsize: 12,
                        ),
                        Txt(
                          text: '12-12-2020 | 12:45 PM',
                          weight: FontWeight.w500,
                          fsize: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.sp,
                    ),
                    Row(
                      children: [
                        Txt(
                          text: 'Delivery Estimation on : ',
                          color: Colors.grey,
                          fsize: 12,
                        ),
                        Txt(
                          text: '12-12-2020',
                          weight: FontWeight.w500,
                          fsize: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    for (int i = 0; i < 2; i++)
                      Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 75.sp,
                                  width: 75.sp,
                                  child: Placeholder(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Txt(
                                        text: 'Glass table',
                                        fsize: 13,
                                        weight: FontWeight.w500,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Txt(
                                              text: 'Quantity : ',
                                              fsize: 12,
                                              color: Colors.grey,
                                            ),
                                            Txt(
                                              text: '3',
                                              fsize: 12,
                                              weight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            StarRating(
                                              starConfig: StarConfig(
                                                fillColor: Colors.green,
                                                size: 20,
                                                strokeColor: Colors.green,
                                              ),
                                              rating: rating,
                                              onChangeRating: (int rating) {
                                                setState(() {
                                                  this.rating =
                                                      rating.toDouble();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Txt(
                                                text: 'Edit Review',
                                                fsize: 12,
                                                weight: FontWeight.w500,
                                                color: Get.theme.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.sp,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
