import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

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
                                text: 'Demo',
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
                                      text: 'Demo Address Comes Here' * 3,
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
                                text: 'Near Post Office',
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
                                text: '987654321',
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
                  Container(
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
                  SizedBox(
                    height: 10,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text: 'M.R.P.',
                                            fsize: 12,
                                            color: Colors.grey,
                                          ),
                                          Txt(
                                            text: '₹1234',
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
                                                text: '3',
                                                fsize: 12,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Txt(
                                            text: '₹1234',
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
                                    height: 60.sp,
                                    width: 60.sp,
                                    child: Placeholder(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Txt(
                                  text: 'Online Payment',
                                  weight: FontWeight.w500,
                                  fsize: 14,
                                ),
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
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
                                    height: 60.sp,
                                    width: 60.sp,
                                    child: Placeholder(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Txt(
                                  text: 'Cash on Delivery',
                                  weight: FontWeight.w500,
                                  fsize: 14,
                                ),
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
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
              child:
                  RaisedGradientButton(text: 'Place Order', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
