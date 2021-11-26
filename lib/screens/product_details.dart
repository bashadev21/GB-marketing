import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/checkout.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:gb_marketing/widgets/zoom_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final TextEditingController c1 = new TextEditingController();

  final TextEditingController c2 = new TextEditingController();

  final HomeCon hcon = Get.find();
  Future<bool> onWillPop() {
    hcon.delcheck.value = 'check';
    hcon.itemcount.value = 1;
    hcon.pincode.clear();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final prod = hcon.productdetials;
    var pageController =
        PageController(initialPage: hcon.selectedPageIndex.value);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          appBar: BaseAppBar(
            backicon: true,
            title: 'Product Details',
            carticon: true,
            ontap: () {
              Get.back();
              hcon.delcheck.value = 'check';
              hcon.itemcount.value = 1;
              hcon.pincode.clear();
            },
          ),
          body: Obx(
            () => hcon.load.value
                ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Loader(),
                        Center(child: CupertinoActivityIndicator()),
                        SizedBox(height: 10),
                        Text('Fetching Details...'),
                      ],
                    ),
                  )
                : ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        height: 280,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => ZoomImage(imgs: prod['image']));
                              },
                              child: PageView.builder(
                                  controller: pageController,
                                  onPageChanged: (o) {
                                    hcon.selectedPageIndex.value = o;
                                  },
                                  physics: BouncingScrollPhysics(),
                                  itemCount: prod['image'].length,
                                  itemBuilder: (context, index) {
                                    return prod['image'][index]['image'] == ''
                                        ? Container(
                                            child:
                                                Image.asset('assets/logo.png'),
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: API().imagebase +
                                                prod['image'][index]['image'],
                                            placeholder: (context, url) =>
                                                Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          );
                                  }),
                            ),
                            Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      prod['image'].length,
                                      (index) => Obx(() {
                                        return AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.decelerate,
                                          margin: const EdgeInsets.all(4),
                                          width: hcon.selectedPageIndex.value ==
                                                  index
                                              ? 10
                                              : 6,
                                          height:
                                              hcon.selectedPageIndex.value ==
                                                      index
                                                  ? 10
                                                  : 6,
                                          decoration: BoxDecoration(
                                            color:
                                                hcon.selectedPageIndex.value ==
                                                        index
                                                    ? Get.theme.primaryColor
                                                    : Colors.grey,
                                            shape: BoxShape.circle,
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: Column(
                          children: [
                            ListTile(
                              trailing: Container(
                                width: 60,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        prod['favourite_list'] == 'true'
                                            ? prod['favourite_list'] = 'false'
                                            : prod['favourite_list'] = 'true';
                                        hcon.favaddremove(prod['product_id']);
                                      },
                                      child: Icon(
                                        prod['favourite_list'] == 'false'
                                            ? CupertinoIcons.heart
                                            : CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                      ),
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
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Txt(
                                    text: prod['rating'] == '0'
                                        ? 'No Ratings yet'
                                        : prod['rating'],
                                    fsize: 10,
                                    weight: FontWeight.w500,
                                  ),
                                  if (prod['rating'] != '0')
                                    Icon(
                                      Icons.star,
                                      size: 16.sp,
                                      color: Colors.green,
                                    )
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '₹ ${prod['slashed_price']}',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color:
                                                  Get.theme.primaryColorLight,
                                              decoration:
                                                  TextDecoration.lineThrough),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Txt(
                                      text: GetStorage()
                                                      .read('vendor')
                                                      .toString() ==
                                                  'null' ||
                                              GetStorage()
                                                      .read('vendor')
                                                      .toString() ==
                                                  'false'
                                          ? '₹${int.parse(prod['product_price']) * hcon.itemcount.value} INR'
                                          : '₹${int.parse(prod['vendor_price']) * hcon.itemcount.value} INR',
                                      color: Colors.pink,
                                      fsize: 20,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            hcon.decrement();
                                          },
                                          child: Icon(Icons.remove_circle,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Obx(
                                          () => CTextField(
                                            enabled: false,
                                            controller: hcon.qty
                                              ..text = hcon.itemcount.value
                                                  .toString(),
                                            max: 2,
                                            padd: 7,
                                            label: 'Qty',
                                            islabel: true,
                                            keyboard: TextInputType.number,
                                          ),
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            hcon.increment();
                                          },
                                          child: Icon(Icons.add_circle,
                                              color: Colors.pink),
                                        ),
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
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: RaisedGradientButton(
                                          ispink: true,
                                          text: 'Add to Cart',
                                          onPressed: () {
                                            hcon.productadd(prod['product_id'],
                                                hcon.qty.text);
                                          })),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: RaisedGradientButton(
                                          text: 'Buy Now',
                                          onPressed: () {
                                            final CartCon ccon = Get.find();
                                            ccon.cartlist.clear();

                                            prod['quantity'] =
                                                hcon.qty.text.toString();
                                            ccon.cartlist.add(prod);
                                            ccon.addsum();

                                            ccon.singleprodid.value =
                                                prod['product_id'];
                                            ccon.singleqty.value =
                                                hcon.qty.text;
                                            Get.to(() => CheckOutView(
                                                  isbuynow: true,
                                                ));
                                          }))
                                ],
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
                                              text: 'Delivery',
                                              fsize: 14,
                                              weight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
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
                                                        text:
                                                            hcon.delcheck.value,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CTextField(
                                                controller: hcon.pincode,
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
                                                  onPressed: () {
                                                    if (hcon.pincode.text
                                                            .length !=
                                                        6) {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            'Enter valid pincode',
                                                        backgroundColor:
                                                            Colors.black54,
                                                        textColor: Colors.white,
                                                      );
                                                    } else {
                                                      hcon.deliverycheck();
                                                    }
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                        prod['product_detail'],
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.7,
                                        crossAxisCount: 2),
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
          )),
    );
  }
}
