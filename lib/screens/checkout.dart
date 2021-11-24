import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/addressbook/all_address.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({Key? key}) : super(key: key);
  final CartCon ccon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Checkout',
        carticon: true,
      ),
      body: Padding(
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
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt(
                                      text:
                                          '${ccon.checklist[0]['doorno']} , ${ccon.checklist[0]['street']} , ${ccon.checklist[0]['city']} - ${ccon.checklist[0]['pincode']} - ${ccon.checklist[0]['state']}',
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
                                text: '${ccon.checklist[0]['landmark']}',
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
                                text: '${ccon.checklist[0]['mobile_no']}',
                                fsize: 12,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AddressView());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: Txt(
                          text: 'Manage Address',
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
                                child: ccon.cartlist[i]['product_img'] == ''
                                    ? Container(
                                        child: Image.asset('assets/logo.png'),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: API().imagebase +
                                            ccon.cartlist[i]['product_img'],
                                        placeholder: (context, url) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt(
                                      text: ccon.cartlist[i]['product_name'],
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
                                            text:
                                                '₹${ccon.cartlist[i]['product_price']}',
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
                                            MainAxisAlignment.spaceBetween,
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
                                            text:
                                                '₹ ${int.parse(ccon.cartlist[i]['product_price']) * int.parse(ccon.cartlist[i]['quantity'])}',
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
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  text: 'Sub Price',
                                  color: Colors.grey,
                                  fsize: 14,
                                ),
                                Txt(
                                  text: '₹12322',
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  text: 'CGST',
                                  color: Colors.grey,
                                  fsize: 14,
                                ),
                                Txt(
                                  text: '₹123',
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  text: 'SGST',
                                  color: Colors.grey,
                                  fsize: 14,
                                ),
                                Txt(
                                  text: '₹123',
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  text: 'Shipping Charge',
                                  color: Colors.grey,
                                  fsize: 14,
                                ),
                                Txt(
                                  text: '₹123',
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
                                    text: '₹12322',
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
                      Txt(
                        text:
                            'Delivery Available.Estimated Delivery by 10 days',
                        color: Colors.green,
                        fsize: 10,
                        weight: FontWeight.w500,
                      ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                    value: true,
                                    groupValue: true,
                                    toggleable: true,
                                    onChanged: (s) {}))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                    value: false,
                                    groupValue: true,
                                    toggleable: true,
                                    onChanged: (s) {}))
                          ],
                        ),
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
                child:
                    RaisedGradientButton(text: 'Place Order', onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
