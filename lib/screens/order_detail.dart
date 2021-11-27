import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double rating = 0.0;
  final ProfileCon pcon = Get.find();

  @override
  Widget build(BuildContext context) {
    // final order = pcon.uniorderslist[0];
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Order Details',
        carticon: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.sp),
          child: Obx(
            () => pcon.uniorderslist.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Txt(
                          text: 'Fetching Details',
                        )
                      ],
                    ),
                  )
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Txt(
                            text: 'Order ID : ',
                            color: Colors.grey,
                            fsize: 14,
                          ),
                          Txt(
                            text: pcon.uniorderslist[0]['uni_order_id'],
                            weight: FontWeight.w500,
                            fsize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Txt(
                            text: 'Order Date : ',
                            color: Colors.grey,
                            fsize: 14,
                          ),
                          Txt(
                            text:
                                '${pcon.uniorderslist[0]['ordered_on_date']} | ${pcon.uniorderslist[0]['ordered_on_time']}',
                            weight: FontWeight.w500,
                            fsize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (int i = 0;
                          i < pcon.uniorderslist[0]['order_detail'].length;
                          i++)
                        Card(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 75.sp,
                                      width: 75.sp,
                                      child: pcon.uniorderslist[0]
                                                      ['order_detail'][i]
                                                  ['product_main_img'] ==
                                              ''
                                          ? Container(
                                              child: Image.asset(
                                                  'assets/logo.png'),
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: API().imagebase +
                                                  pcon.uniorderslist[0]
                                                          ['order_detail'][i]
                                                      ['product_main_img'],
                                              placeholder: (context, url) =>
                                                  Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
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
                                            text: pcon.uniorderslist[0]
                                                    ['order_detail'][i]
                                                ['product_name'],
                                            fsize: 13,
                                            lines: 2,
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
                                                  text: pcon.uniorderslist[0]
                                                          ['order_detail'][i]
                                                      ['product_count'],
                                                  fsize: 12,
                                                  weight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                          ),
                                          pcon.uniorderslist[0]
                                                      ['order_stage'] ==
                                                  'Pending'
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      StarRating(
                                                        starConfig: StarConfig(
                                                          fillColor:
                                                              Colors.green,
                                                          size: 20,
                                                          strokeColor:
                                                              Colors.green,
                                                        ),
                                                        rating: double.parse(pcon
                                                                    .uniorderslist[0]
                                                                ['order_detail']
                                                            [
                                                            i]['product_rating']),
                                                        onChangeRating:
                                                            (int rating) {
                                                          setState(() {
                                                            pcon.ratingreview(
                                                                pcon.uniorderslist[
                                                                            0][
                                                                        'order_detail'][i]
                                                                    [
                                                                    'product_id'],
                                                                rating
                                                                    .toString(),
                                                                '');
                                                            // if (pcon.uniorderslist[
                                                            //                 0][
                                                            //             'order_detail'][i]
                                                            //         [
                                                            //         'product_rating'] ==
                                                            //     '0') {
                                                            pcon.uniorderslist[
                                                                            0][
                                                                        'order_detail'][i]
                                                                    [
                                                                    'product_rating'] =
                                                                rating
                                                                    .toString();
                                                            // }
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          pcon.uniorderslist[0]['order_detail']
                                                      [i]['product_rating'] !=
                                                  '0'
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Txt(
                                                          text: pcon.uniorderslist[
                                                                              0]
                                                                          [
                                                                          'order_detail'][i]
                                                                      [
                                                                      'product_review'] ==
                                                                  ''
                                                              ? 'Add Review'
                                                              : 'Edit Review',
                                                          fsize: 12,
                                                          weight:
                                                              FontWeight.w500,
                                                          color: Get.theme
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if (pcon.uniorderslist[0][
                                                                'order_detail'][i]
                                                            [
                                                            'product_deliver_status'] ==
                                                        '1') {
                                                      if (pcon.uniorderslist[0][
                                                                  'order_detail'][i]
                                                              [
                                                              'product_return_status'] ==
                                                          'true') {
                                                      } else {
                                                        Get.dialog(Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child: Container(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                40,
                                                                          ),
                                                                          Txt(
                                                                            text:
                                                                                'Cancel Product',
                                                                            weight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child: Container(
                                                                                height: 40,
                                                                                width: 40,
                                                                                child: Icon(
                                                                                  Icons.clear,
                                                                                  color: Colors.white,
                                                                                ),
                                                                                decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(15))),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Txt(
                                                                        text:
                                                                            'Are you sure want to Cancel the Product?',
                                                                        weight:
                                                                            FontWeight.w500,
                                                                        color: Colors
                                                                            .grey,
                                                                        defalutsize:
                                                                            true,
                                                                        iscenter:
                                                                            true,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                120,
                                                                            child: RaisedGradientButton(
                                                                                ispink: true,
                                                                                text: 'Yes, Cancel',
                                                                                onPressed: () {}),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                height:
                                                                    Get.height *
                                                                        .3,
                                                                width:
                                                                    Get.width *
                                                                        .80,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.pink,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      child: Txt(
                                                        text: pcon.uniorderslist[
                                                                            0][
                                                                        'order_detail'][i]
                                                                    [
                                                                    'product_deliver_status'] ==
                                                                '0'
                                                            ? 'Cancelled'
                                                            : pcon.uniorderslist[0]
                                                                            ['order_detail'][i]
                                                                        [
                                                                        'product_return_status'] ==
                                                                    'true'
                                                                ? 'Return'
                                                                : 'cancel',
                                                        fsize: 10,
                                                        weight: FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30.sp,
                                                ),
                                                Txt(
                                                  text:
                                                      '₹ ${pcon.uniorderslist[0]['order_detail'][i]['product_order_price']}',
                                                  fsize: 13,
                                                  weight: FontWeight.w500,
                                                  color: Colors.pink,
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
                              SizedBox(
                                height: 4.sp,
                              ),
                            ],
                          ),
                        ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 13, top: 50),
                            width: 3,
                            height: 400,
                            color: Colors.grey[400],
                          ),
                          Column(
                            children: [
                              statusWidget("Order Placed", true),
                              statusWidget(
                                  "Shipped",
                                  pcon.uniorderslist[0]['order_stage'] ==
                                          'Pending'
                                      ? false
                                      : pcon.uniorderslist[0]['order_stage'] ==
                                              'Shipping'
                                          ? true
                                          : pcon.uniorderslist[0]
                                                      ['order_stage'] ==
                                                  'Delivered'
                                              ? true
                                              : pcon.uniorderslist[0]
                                                          ['order_stage'] ==
                                                      'Fitting'
                                                  ? true
                                                  : pcon.uniorderslist[0]
                                                              ['order_stage'] ==
                                                          'Completed'
                                                      ? true
                                                      : false),
                              statusWidget(
                                  "Delivered",
                                  pcon.uniorderslist[0]['order_stage'] ==
                                          'Pending'
                                      ? false
                                      : pcon.uniorderslist[0]['order_stage'] ==
                                              'Shipping'
                                          ? false
                                          : pcon.uniorderslist[0]
                                                      ['order_stage'] ==
                                                  'Delivered'
                                              ? true
                                              : pcon.uniorderslist[0]
                                                          ['order_stage'] ==
                                                      'Fitting'
                                                  ? true
                                                  : pcon.uniorderslist[0]
                                                              ['order_stage'] ==
                                                          'Completed'
                                                      ? true
                                                      : false),
                              statusWidget(
                                  "Fitting",
                                  pcon.uniorderslist[0]['order_stage'] ==
                                          'Pending'
                                      ? false
                                      : pcon.uniorderslist[0]['order_stage'] ==
                                              'Shipping'
                                          ? false
                                          : pcon.uniorderslist[0]
                                                      ['order_stage'] ==
                                                  'Delivered'
                                              ? false
                                              : pcon.uniorderslist[0]
                                                          ['order_stage'] ==
                                                      'Fitting'
                                                  ? true
                                                  : pcon.uniorderslist[0]
                                                              ['order_stage'] ==
                                                          'Completed'
                                                      ? true
                                                      : false),
                              statusWidget(
                                  "Completed",
                                  pcon.uniorderslist[0]['order_stage'] ==
                                          'Pending'
                                      ? false
                                      : pcon.uniorderslist[0]['order_stage'] ==
                                              'Shipping'
                                          ? false
                                          : pcon.uniorderslist[0]
                                                      ['order_stage'] ==
                                                  'Delivered'
                                              ? true
                                              : pcon.uniorderslist[0]
                                                          ['order_stage'] ==
                                                      'Fitting'
                                                  ? false
                                                  : pcon.uniorderslist[0]
                                                              ['order_stage'] ==
                                                          'Completed'
                                                      ? true
                                                      : false),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Txt(
                            text:
                                pcon.uniorderslist[0]['estimate'].toString() ==
                                        'true'
                                    ? 'Delivery Estimated on: '
                                    : 'Delivered on: ',
                            color: Colors.grey,
                            fsize: 14,
                          ),
                          Txt(
                            text: '${pcon.uniorderslist[0]['deliverdate']}',
                            weight: FontWeight.w500,
                            fsize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Txt(
                            text: 'Delivery Address: ',
                            weight: FontWeight.w500,
                            fsize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Txt(
                                    text: pcon.uniorderslist[0]['fullname'],
                                    fsize: 13,
                                    weight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Txt(
                                          text:
                                              '${pcon.uniorderslist[0]['door_no']} , ${pcon.uniorderslist[0]['area']} , ${pcon.uniorderslist[0]['city']} - ${pcon.uniorderslist[0]['pincode']} , ${pcon.uniorderslist[0]['state']}',
                                          weight: FontWeight.w500,
                                          fsize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Txt(
                                    text: 'Landmark - ',
                                    color: Colors.grey,
                                    fsize: 11,
                                  ),
                                  Txt(
                                    text: pcon.uniorderslist[0]['landmark'],
                                    fsize: 12,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Txt(
                                    text: 'Contact    - ',
                                    color: Colors.grey,
                                    fsize: 11,
                                  ),
                                  Txt(
                                    text: pcon.uniorderslist[0]['phone_no'],
                                    fsize: 12,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Txt(
                                    text: 'Price Details',
                                    weight: FontWeight.w500,
                                  ),
                                  Txt(
                                    text: 'Inclusive of all taxes.',
                                    color: Colors.grey,
                                    fsize: 10,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Txt(
                                      text: 'Sub Price',
                                      color: Colors.grey,
                                      fsize: 14,
                                    ),
                                    Txt(
                                      text:
                                          '₹ ${int.parse(pcon.uniorderslist[0]['total_order_price']) - int.parse(pcon.uniorderslist[0]['deliver_charge'])}',
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Txt(
                                      text: 'Shipping Charge',
                                      color: Colors.grey,
                                      fsize: 14,
                                    ),
                                    Txt(
                                      text:
                                          '₹ ${pcon.uniorderslist[0]['deliver_charge']}',
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.teal[400],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Txt(
                                        text: 'Total Price',
                                        color: Colors.white,
                                        fsize: 14,
                                      ),
                                      Txt(
                                        text:
                                            '₹  ${int.parse(pcon.uniorderslist[0]['total_order_price'])}',
                                        weight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
          )),
    );
  }

  Container statusWidget(String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isActive) ? Colors.green : Colors.white,
                border: Border.all(
                    color: (isActive) ? Colors.transparent : Colors.green,
                    width: 3)),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 22,
                width: 40,
              ),
              Txt(
                  text: status,
                  weight: FontWeight.w500,
                  color: (isActive) ? Colors.green : Colors.black,
                  fsize: 14),
              Container(
                height: 20,
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
