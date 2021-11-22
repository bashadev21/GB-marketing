import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key}) : super(key: key);
  final TextEditingController c1 = new TextEditingController();
  final TextEditingController c2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Product Details',
        carticon: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 280,
            child: PageView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Placeholder();
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Column(
              children: [
                ListTile(
                  trailing: Container(
                    width: 60,
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.heart,
                          color: Colors.red,
                        ),
                        Spacer(),
                        Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  title: Txt(
                    text: 'Demo Product Name Comes Here !!!',
                    fsize: 14,
                    weight: FontWeight.w500,
                  ),
                  subtitle: Txt(
                    text: 'Hurry, only few left !!',
                    color: Get.theme.primaryColorLight,
                    fsize: 11,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Txt(
                        text: 'No ratings yet',
                        fsize: 10,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Txt(
                        text: 'Product Id :  ',
                        color: Colors.grey,
                        fsize: 12,
                      ),
                      Txt(
                        text: 'GB123',
                        weight: FontWeight.w500,
                        fsize: 12,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'Material Type :  ',
                        color: Colors.grey,
                        fsize: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              text: 'Artificial Leather,Wood',
                              weight: FontWeight.w500,
                              fsize: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'Dimension :  ',
                        color: Colors.grey,
                        fsize: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              text: '12 x 12 cm ' * 20,
                              weight: FontWeight.w500,
                              fsize: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        text: 'Brand Name :  ',
                        color: Colors.grey,
                        fsize: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              text: 'GBM',
                              weight: FontWeight.w500,
                              fsize: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Txt(
                        text: 'M.R.P. ',
                        color: Colors.grey,
                        fsize: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '₹12344',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Get.theme.primaryColorLight,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Txt(
                        text: '₹12344 INR',
                        color: Colors.pink,
                        fsize: 20,
                        weight: FontWeight.w500,
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          children: [
                            Icon(Icons.remove_circle, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CTextField(
                                controller: c1,
                                max: 2,
                                padd: 7,
                                label: 'Qty',
                                islabel: true,
                                keyboard: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.add_circle, color: Colors.pink),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Txt(
                        text: 'Save ₹12344 ',
                        color: Colors.grey,
                        fsize: 10,
                      ),
                      Txt(
                        text: '(10% OFF) ',
                        color: Colors.red,
                        fsize: 10,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 50,
                //   child: Row(
                //     children: [
                //       Expanded(
                //           child: RaisedGradientButton(
                //               ispink: true,
                //               text: 'Add to Cart',
                //               onPressed: () {})),
                //       SizedBox(
                //         width: 8,
                //       ),
                //       Expanded(
                //           child: RaisedGradientButton(
                //               text: 'Buy Now', onPressed: () {}))
                //     ],
                //   ),
                // ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Txt(
                                  text: 'Delivery',
                                  fsize: 14,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CTextField(
                                    controller: c2,
                                    max: 6,
                                    padd: 7,
                                    islabel: true,
                                    label: 'Pincode',
                                    keyboard: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 80,
                                  height: 45,
                                  child: RaisedGradientButton(
                                      ispink: true,
                                      text: 'Check',
                                      onPressed: () {}),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Txt(
                                      text:
                                          'Enter Pincode to get Delivery Info & Estimation date',
                                      fsize: 9,
                                      iscenter: true,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Txt(
                                  text: 'Description',
                                  fsize: 14,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Txt(
                                        text:
                                            'Enter Pincode to get Delivery Info & Estimation date',
                                        fsize: 12,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Txt(
                      text: 'Similar Products',
                      fsize: 14,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
                GridView.builder(
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ProductTile();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
