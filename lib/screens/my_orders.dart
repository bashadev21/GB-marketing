import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';

import '../api_endpoints.dart';
import 'order_detail.dart';

class MyOrdersView extends StatefulWidget {
  MyOrdersView({Key? key}) : super(key: key);

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  double rating = 0.0;
  final ProfileCon pcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          backicon: true,
          title: 'My Orders',
          carticon: true,
        ),
        body: Obx(
          () => pcon.myorderslist.length == 0
              ? Center(
                  child: Txt(
                    text: 'No Orders Found',
                  ),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: pcon.myorderslist.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final order = pcon.myorderslist[index];
                    return InkWell(
                      onTap: () {
                        pcon.uniorder(order['order_id']);
                        Get.to(() => OrderDetails());
                      },
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
                                    text: order['uni_order_id'],
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
                                    text:
                                        '${order['ordered_on_date']} | ${order['ordered_on_time']} ',
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
                                    text: order['deliverdate'],
                                    weight: FontWeight.w500,
                                    fsize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              if (order['order_detail'].toString() != 'null')
                                for (int i = 0;
                                    i < order['order_detail'].length;
                                    i++)
                                  Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 75.sp,
                                              width: 75.sp,
                                              child: order['order_detail'][i][
                                                          'product_main_img'] ==
                                                      ''
                                                  ? Container(
                                                      child: Image.asset(
                                                          'assets/logo.png'),
                                                    )
                                                  : CachedNetworkImage(
                                                      imageUrl: API()
                                                              .imagebase +
                                                          order['order_detail']
                                                                  [i][
                                                              'product_main_img'],
                                                      placeholder:
                                                          (context, url) =>
                                                              Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
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
                                                    text: order['order_detail']
                                                        [i]['product_name'],
                                                    fsize: 13,
                                                    lines: 2,
                                                    weight: FontWeight.w500,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    child: Row(
                                                      children: [
                                                        Txt(
                                                          text: 'Quantity : ',
                                                          fsize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                        Txt(
                                                          text: order[
                                                                  'order_detail']
                                                              [
                                                              i]['product_count'],
                                                          fsize: 12,
                                                          weight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets.symmetric(
                                                  //       vertical: 5),
                                                  //   child: Row(
                                                  //     children: [
                                                  //       StarRating(
                                                  //         starConfig: StarConfig(
                                                  //           fillColor: Colors.green,
                                                  //           size: 20,
                                                  //           strokeColor: Colors.green,
                                                  //         ),
                                                  //         rating: double.parse(
                                                  //             order['order_detail'][i]
                                                  //                 ['product_rating']),
                                                  //         onChangeRating: (int rating) {
                                                  //           setState(() {
                                                  //             order['order_detail'][i][
                                                  //                     'product_rating'] =
                                                  //                 rating.toString();
                                                  //           });
                                                  //         },
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets.symmetric(
                                                  //       vertical: 5),
                                                  //   child: Row(
                                                  //     children: [
                                                  //       InkWell(
                                                  //         onTap: () {},
                                                  //         child: Txt(
                                                  //           text: 'Edit Review',
                                                  //           fsize: 12,
                                                  //           weight: FontWeight.w500,
                                                  //           color:
                                                  //               Get.theme.primaryColor,
                                                  //         ),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
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
        ));
  }
}
