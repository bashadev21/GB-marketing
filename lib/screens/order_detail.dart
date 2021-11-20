import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Order Details',
        carticon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        child: ListView(
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
                  text: '1234567',
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
                  text: '20-12-2020 | 07:22 PM',
                  weight: FontWeight.w500,
                  fsize: 14,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < 2; i++)
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
                            child: Placeholder(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                text: 'Glass table',
                                fsize: 13,
                                weight: FontWeight.w500,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                          this.rating = rating.toDouble();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Txt(
                                          text: 'Return',
                                          fsize: 10,
                                          weight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.sp,
                                    ),
                                    Txt(
                                      text: '₹12322',
                                      fsize: 13,
                                      weight: FontWeight.w500,
                                      color: Colors.pink,
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                    statusWidget("Shipped", false),
                    statusWidget("Delivered", false),
                    statusWidget("Fitting", false),
                    statusWidget("Completed", false),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Txt(
                  text: 'Delivery Estimated on: ',
                  color: Colors.grey,
                  fsize: 14,
                ),
                Txt(
                  text: '20-12-2020',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: 25,
            ),
          ],
        ),
      ),
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
