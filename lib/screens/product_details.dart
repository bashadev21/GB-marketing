import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({Key? key}) : super(key: key);
  final TextEditingController c1 = new TextEditingController();
  final TextEditingController c2 = new TextEditingController();
  final HomeCon hcon = Get.find();
  @override
  Widget build(BuildContext context) {
    final prod = hcon.productdetials;

    return Scaffold(
        appBar: BaseAppBar(
          backicon: true,
          title: 'Product Details',
          carticon: true,
        ),
        body: Obx(
          () => ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: 280,
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: prod['image'].length,
                    itemBuilder: (context, index) {
                      return prod['image'][index]['image'] == ''
                          ? Container(
                              child: Image.asset('assets/logo.png'),
                            )
                          : CachedNetworkImage(
                              imageUrl: API().imagebase +
                                  prod['image'][index]['image'],
                              placeholder: (context, url) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            );
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
                        text: prod['product_name'],
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
                            text: prod['model_no'],
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
                                  text: prod['material_type'],
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
                                  text: prod['dimension'],
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
                                  text: prod['brand_name'],
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
                                  '₹ ${prod['slashed_price']}',
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
                            text: '₹${prod['product_price']} INR',
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
                            text: 'Save ₹${prod['discount_price']} ',
                            color: Colors.grey,
                            fsize: 10,
                          ),
                          Txt(
                            text: '(${prod['discount_percent']}% OFF) ',
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
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
                                            text: prod['product_detail'],
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
                        itemCount: prod['similar_product'].length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ProductTile(
                            prod: prod['similar_product'][index],
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
