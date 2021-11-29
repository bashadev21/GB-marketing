import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/addressbook/all_address.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class CheckOutView extends StatefulWidget {
  final bool isbuynow;
  CheckOutView({Key? key, this.isbuynow = false}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  final CartCon ccon = Get.find();
  final HomeCon hcon = Get.find();
  Future<bool> onWillPop() {
    if (widget.isbuynow) {
      ccon.getcartlist();
      ccon.singleprodid.value = '';
      ccon.singleqty.value = '';
    }
    return Future.value(true);
  }

  final TextEditingController couponcon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          appBar: BaseAppBar(
            backicon: true,
            title: 'Checkout',
            carticon: false,
            ontap: () {
              Get.back();
              if (widget.isbuynow) {
                ccon.getcartlist();
                ccon.singleprodid.value = '';
                ccon.singleqty.value = '';
              }
            },
          ),
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Txt(
                          text: 'Shipping to',
                          fsize: 13,
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (ccon.checklist.length != 0)
                          Obx(
                            () => Card(
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
                                          text: ccon.checklist[0]['fullname'],
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
                                                    '${ccon.door.value} , ${ccon.street.value} , ${ccon.city.value} - ${ccon.pincode.value} - ${ccon.state.value}',
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
                                          text: '${ccon.land.value}',
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
                                          text: '${ccon.mobile.value}',
                                          fsize: 12,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AddressView(
                                  isselect: true,
                                ));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Txt(
                                text: ccon.checklist.length != 0
                                    ? 'Manage Address'
                                    : 'Add Address',
                                color: Colors.white,
                                defalutsize: true,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        for (int i = 0; i < ccon.cartlist.length; i++)
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 75.sp,
                                      width: 75.sp,
                                      child:
                                          ccon.cartlist[i]['product_img'] == ''
                                              ? Container(
                                                  child: Image.asset(
                                                      'assets/logo.png'),
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl: API().imagebase +
                                                      ccon.cartlist[i]
                                                          ['product_img'],
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
                                            text: ccon.cartlist[i]
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
                                                  text: 'M.R.P.',
                                                  fsize: 12,
                                                  color: Colors.grey,
                                                ),
                                                Txt(
                                                  text: GetStorage()
                                                                  .read(
                                                                      'vendor')
                                                                  .toString() ==
                                                              'null' ||
                                                          GetStorage()
                                                                  .read(
                                                                      'vendor')
                                                                  .toString() ==
                                                              'false'
                                                      ? '₹${ccon.cartlist[i]['product_price']}'
                                                      : '₹${ccon.cartlist[i]['vendor_price']}',
                                                  color: Colors.pink,
                                                  weight: FontWeight.w500,
                                                  fsize: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Txt(
                                                      text: 'Quantity : ',
                                                      fsize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                    Txt(
                                                      text: ccon.cartlist[i]
                                                          ['quantity'],
                                                      fsize: 12,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ],
                                                ),
                                                Txt(
                                                  text: GetStorage()
                                                                  .read(
                                                                      'vendor')
                                                                  .toString() ==
                                                              'null' ||
                                                          GetStorage()
                                                                  .read(
                                                                      'vendor')
                                                                  .toString() ==
                                                              'false'
                                                      ? '₹ ${int.parse(ccon.cartlist[i]['product_price']) * int.parse(ccon.cartlist[i]['quantity'])}'
                                                      : '₹ ${int.parse(ccon.cartlist[i]['vendor_price']) * int.parse(ccon.cartlist[i]['quantity'])}',
                                                )
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
                                height: 5.sp,
                              ),
                            ],
                          ),
                        if (GetStorage().read('vendor').toString() == 'true')
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[300],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Obx(() => hcon.delcheck.value !=
                                                      'check'
                                                  ? Txt(
                                                      text: hcon.delcheck.value,
                                                      fsize: 9,
                                                      iscenter: true,
                                                      color: hcon.delcheck
                                                                  .value ==
                                                              'Delivery Available'
                                                          ? Colors.green
                                                          : Colors.pink,
                                                      weight: FontWeight.w500,
                                                    )
                                                  : SizedBox()),
                                              SizedBox(
                                                height: 5,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    if (ccon.discount.value != '0')
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              ccon.discount.value = '0';
                                            },
                                            child: Txt(
                                              text: 'Remove',
                                              fsize: 12,
                                              weight: FontWeight.w500,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CTextField(
                                              controller: couponcon,
                                              padd: 7,
                                              islabel: true,
                                              label: 'Coupon Code',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 30.w,
                                            height: 45,
                                            child: RaisedGradientButton(
                                                ispink: true,
                                                text: ccon.discount.value == '0'
                                                    ? '  Check  '
                                                    : 'Applied',
                                                onPressed: () {
                                                  if (couponcon.text.isEmpty) {
                                                    Fluttertoast.showToast(
                                                      msg: 'Enter Coupon code',
                                                      backgroundColor:
                                                          Colors.black54,
                                                      textColor: Colors.white,
                                                    );
                                                  } else if (ccon.discount.value
                                                          .toString() !=
                                                      '') {
                                                    ccon.applycoupon(
                                                        couponcon.text);
                                                  } else {}
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                            '₹ ${int.parse(ccon.totalamount.value) - (int.parse(ccon.totalamount.value) / 100 * 9).round() * 2}',
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
                                        text: 'CGST',
                                        color: Colors.grey,
                                        fsize: 14,
                                      ),
                                      Txt(
                                        text:
                                            '₹${(int.parse(ccon.totalamount.value) / 100 * 9).round()}',
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
                                        text: 'SGST',
                                        color: Colors.grey,
                                        fsize: 14,
                                      ),
                                      Txt(
                                        text:
                                            '₹${(int.parse(ccon.totalamount.value) / 100 * 9).round()}',
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
                                        text: '₹${ccon.shipping.value}',
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                if (ccon.discount.value != '0')
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Txt(
                                          text: 'Discount (-) ',
                                          color: Colors.grey,
                                          fsize: 14,
                                        ),
                                        Txt(
                                          text: '₹${ccon.discount.value}',
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
                                              '₹${(int.parse(ccon.shipping.value) + (int.parse(ccon.totalamount.value)).round()) - int.parse(ccon.discount.value)}',
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
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Expanded(
                                child: Column(
                                  children: [
                                    Txt(
                                      text: ccon.msg.value ==
                                              'Delivery Currently Unavailable'
                                          ? 'Delivery Currently Unavailable for this location'
                                          : 'Delivery Available.Estimated Delivery by ${ccon.days.value} days',
                                      color: ccon.msg.value ==
                                              'Delivery Currently Unavailable'
                                          ? Colors.red
                                          : Colors.green,
                                      fsize: 10,
                                      iscenter: true,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Txt(
                            text: 'Mode of Payment',
                            fsize: 15,
                            weight: FontWeight.w500,
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    ccon.onlinepay.value = true;
                                    ccon.codpay.value = false;
                                  },
                                  child: Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 40.sp,
                                                width: 40.sp,
                                                child: Placeholder(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Txt(
                                              text: 'Online Payment',
                                              weight: FontWeight.w500,
                                              fsize: 12,
                                            ),
                                          ],
                                        ),
                                        Transform.scale(
                                            scale: 1.4,
                                            child: Radio(
                                                activeColor: Colors.green,
                                                value: ccon.onlinepay.value,
                                                groupValue: true,
                                                toggleable: true,
                                                onChanged: (s) {
                                                  ccon.onlinepay.value = true;
                                                  ccon.codpay.value = false;
                                                }))
                                      ],
                                    ),
                                  )),
                              InkWell(
                                  onTap: () {
                                    ccon.onlinepay.value = false;
                                    ccon.codpay.value = true;
                                  },
                                  child: Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 40.sp,
                                                width: 40.sp,
                                                child: Placeholder(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Txt(
                                              text: 'Cash on Delivery',
                                              weight: FontWeight.w500,
                                              fsize: 12,
                                            ),
                                          ],
                                        ),
                                        Transform.scale(
                                            scale: 1.4,
                                            child: Radio(
                                                activeColor: Colors.green,
                                                value: ccon.codpay.value,
                                                groupValue: true,
                                                toggleable: true,
                                                onChanged: (s) {
                                                  ccon.onlinepay.value = false;
                                                  ccon.codpay.value = true;
                                                }))
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: kBottomNavigationBarHeight + 5,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedGradientButton(
                          text: 'Place Order',
                          onPressed: () {
                            if (ccon.checklist.length == 0) {
                              Fluttertoast.showToast(
                                msg: 'Add Delivery Address',
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            } else if (ccon.msg.value ==
                                'Delivery Currently Unavailable for given address') {
                              Fluttertoast.showToast(
                                msg: 'Delivery Currently Unavailable',
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            } else if (ccon.onlinepay.value == false &&
                                ccon.codpay.value == false) {
                              Fluttertoast.showToast(
                                msg: 'Select Payment Menthod',
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                            } else {
                              if (ccon.onlinepay.value) {
                                var total = (int.parse(ccon.shipping.value) +
                                    (int.parse(ccon.totalamount.value))
                                        .round());
                                ccon.getrazorpay(total);
                              } else {
                                var total = (int.parse(ccon.shipping.value) +
                                    (int.parse(ccon.totalamount.value))
                                        .round());
                                ccon.codpayment(total);
                              }
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
