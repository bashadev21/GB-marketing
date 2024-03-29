import 'dart:async';
import 'package:gb_marketing/widgets/end_drawer.dart';
import 'package:gb_marketing/widgets/greenBtn.dart';
import 'package:hexcolor/hexcolor.dart';
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
import 'package:share/share.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';
import 'login.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool _enabled = true;

  void _onTap(name, url) {
    setState(() => _enabled = false);
    Share.share(
      '$name \n \n $url',
      subject: 'Check it out GB-Marketing app',
    );
    Timer(Duration(seconds: 1), () => setState(() => _enabled = true));
  }

  final HomeCon hcon = Get.find();
  Future<bool> onWillPop() {
    hcon.delcheck.value = 'check';
    hcon.itemcount.value = 1;
    hcon.pincode.clear();
    hcon.selectedcolor.value = '';
    hcon.selectedcolorname.value = '';
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
          endDrawer: EndDrawerWidget(),
          appBar: BaseAppBar(
            backicon: true,
            title: 'Product Details',
            carticon: true,
            ontap: () {
              Get.back();
              hcon.delcheck.value = 'check';
              hcon.itemcount.value = 1;
              hcon.pincode.clear();
              hcon.selectedcolor.value = '';
              hcon.selectedcolorname.value = '';
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
                                        : Image.network(
                                            API().imagebase +
                                                prod['image'][index]['image'],
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                            return Image.asset(
                                                'assets/placeholder.jpeg');
                                          });
                                    // CachedNetworkImage(
                                    //   imageUrl: API().imagebase +
                                    //       prod['image'][index]['image'],
                                    //   placeholder: (context, url) => Container(
                                    //     decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10.0),
                                    //       color: Colors.grey.withOpacity(0.2),
                                    //     ),
                                    //   ),
                                    //   errorWidget: (context, url, error) =>
                                    //       Icon(Icons.error),
                                    // );
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
                                        if (GetStorage()
                                                .read('userid')
                                                .toString() !=
                                            'null') {
                                          prod['favourite_list'] == 'true'
                                              ? prod['favourite_list'] = 'false'
                                              : prod['favourite_list'] = 'true';
                                          hcon.favaddremove(prod['product_id']);
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: 'Please Login!!!',
                                            backgroundColor: Colors.black54,
                                            textColor: Colors.white,
                                          );
                                          Get.offAll(() => LoginView());
                                        }
                                      },
                                      child: Icon(
                                        prod['favourite_list'] == 'false'
                                            ? CupertinoIcons.heart
                                            : CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        if (_enabled)
                                          _onTap(prod['product_name'],
                                              prod['url']);
                                      },
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              contentPadding: EdgeInsets.all(0),
                              title: Txt(
                                text: prod['product_name'],
                                fsize: 14,
                                weight: FontWeight.bold,
                              ),
                              subtitle: Txt(
                                text: prod['product_quantity'] == '0'
                                    ? 'Out of stock'
                                    : int.parse(prod['product_quantity']) <= 5
                                        ? 'Hurry, only ${int.parse(prod['product_quantity'])} left !!'
                                        : int.parse(prod['product_quantity'])
                                                .isNegative
                                            ? 'Comming soon'
                                            : 'Hurry, only few left !!',
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
                                    weight: FontWeight.bold,
                                    fsize: 12,
                                  )
                                ],
                              ),
                            ),
                            if (prod['color'].toString() != "[]")
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  children: [
                                    Txt(
                                      text: 'Colors :  ',
                                      color: Colors.grey,
                                      fsize: 12,
                                    ),
                                    Obx(() => Wrap(
                                          children: prod['color']
                                              .map((item) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            hcon.getproddetails(
                                                                item[
                                                                    'product_id']);
                                                            Get.to(() =>
                                                                ProductDetailsView());
                                                            hcon.selectedcolor
                                                                    .value =
                                                                item[
                                                                    'color_code'];
                                                            hcon.selectedcolorname
                                                                    .value =
                                                                item[
                                                                    'color_name'];
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: hcon.selectedcolor
                                                                            .value ==
                                                                        item[
                                                                            'color_code']
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              child: Container(
                                                                  height: 25.sp,
                                                                  width: 25.sp,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: HexColor(
                                                                        item[
                                                                            'color_code']),
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Txt(
                                                          text: item[
                                                              'color_name'],
                                                          fsize: 9,
                                                          weight: hcon.selectedcolorname
                                                                      .value ==
                                                                  item[
                                                                      'color_name']
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                              .toList()
                                              .cast<Widget>(),
                                        ))
                                  ],
                                ),
                              ),
                            if (prod['shape'].toString() != "[]")
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt(
                                      text: 'Shapes :  ',
                                      color: Colors.grey,
                                      fsize: 12,
                                    ),
                                    Obx(() => Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: prod['shape']
                                                    .map((item) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  hcon.getproddetails(
                                                                      item[
                                                                          'product_id']);
                                                                  Get.to(() =>
                                                                      ProductDetailsView());
                                                                  // hcon.selectedcolor
                                                                  //         .value =
                                                                  //     item[
                                                                  //         'color_code'];
                                                                  // hcon.selectedcolorname
                                                                  //         .value =
                                                                  //     item[
                                                                  //         'color_name'];
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      // color: hcon.selectedcolor
                                                                      //             .value ==
                                                                      //         item[
                                                                      //             'color_code']
                                                                      //     ? Colors
                                                                      //         .black
                                                                      //     : Colors
                                                                      //         .transparent,
                                                                      shape: BoxShape.circle),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            3.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          35.sp,
                                                                      width:
                                                                          35.sp,
                                                                      child: Image.network(
                                                                          API().imagebase +
                                                                              item['shape'],
                                                                          errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) {
                                                                        return Image.asset(
                                                                            'assets/placeholder.jpeg');
                                                                      }),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ))
                                                    .toList()
                                                    .cast<Widget>(),
                                              ),
                                            ],
                                          ),
                                        ))
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
                                          weight: FontWeight.bold,
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
                                          weight: FontWeight.bold,
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
                                          weight: FontWeight.bold,
                                          fsize: 12,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GetStorage().read('vendor').toString() == 'null' ||
                                    GetStorage().read('vendor').toString() ==
                                        'false'
                                ? Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
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
                                              GetStorage()
                                                              .read('vendor')
                                                              .toString() ==
                                                          'null' ||
                                                      GetStorage()
                                                              .read('vendor')
                                                              .toString() ==
                                                          'false'
                                                  ? Text(
                                                      '₹ ${prod['slashed_price']}',
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Get.theme
                                                              .primaryColorLight,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                    )
                                                  : SizedBox()
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            if (prod['product_notify'] != '')
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.sp),
                                        color: prod['product_notify'] ==
                                                'Out of stock'
                                            ? Colors.red
                                            : Get.theme.primaryColor),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.sp, vertical: 3.sp),
                                    child: Txt(
                                      text: prod['product_notify'],
                                      weight: FontWeight.bold,
                                      color: Colors.white,
                                      fsize: 10,
                                    ),
                                  ),
                                ],
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
                                          ? '₹${int.parse(prod['product_price']) * hcon.itemcount.value} '
                                          : '₹${int.parse(prod['vendor_price']) * hcon.itemcount.value} ',
                                      color: Colors.black87,
                                      fsize: 20,
                                      weight: FontWeight.bold,
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
                            GetStorage().read('vendor').toString() == 'null' ||
                                    GetStorage().read('vendor').toString() ==
                                        'false'
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Txt(
                                          text:
                                              'Save ₹${prod['discount_price']} ',
                                          color: Colors.grey,
                                          fsize: 10,
                                        ),
                                        Txt(
                                          text:
                                              '(${prod['discount_percent']}% OFF) ',
                                          color: Colors.red,
                                          fsize: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: GreenGradientButton(
                                          isgreen: true,
                                          text: 'Add to Cart',
                                          onPressed: () {
                                            if (GetStorage()
                                                    .read('userid')
                                                    .toString() !=
                                                'null') {
                                              hcon.productadd(
                                                  prod['product_id'],
                                                  hcon.qty.text);
                                            } else {
                                              Fluttertoast.showToast(
                                                msg: 'Please Login!!!',
                                                backgroundColor: Colors.black54,
                                                textColor: Colors.white,
                                              );
                                              Get.offAll(() => LoginView());
                                            }
                                          })),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: RaisedGradientButton(
                                          text: 'Buy Now',
                                          onPressed: () {
                                            if (GetStorage()
                                                    .read('userid')
                                                    .toString() !=
                                                'null') {
                                              if (int.parse(prod[
                                                      'product_quantity']) >=
                                                  int.parse(hcon.qty.text
                                                      .toString())) {
                                                print(int.parse(prod[
                                                        'product_quantity']) >=
                                                    int.parse(hcon.qty.text
                                                        .toString()));
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
                                              } else {
                                                Fluttertoast.showToast(
                                                  msg: 'Out of stock',
                                                  backgroundColor:
                                                      Colors.black54,
                                                  textColor: Colors.white,
                                                );
                                              }
                                            } else {
                                              Fluttertoast.showToast(
                                                msg: 'Please Login!!!',
                                                backgroundColor: Colors.black54,
                                                textColor: Colors.white,
                                              );
                                              Get.offAll(() => LoginView());
                                            }
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
                                              weight: FontWeight.bold,
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
                                                        weight: FontWeight.bold,
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
                                                  weight: FontWeight.bold,
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
                                              weight: FontWeight.bold,
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
                                  weight: FontWeight.bold,
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

var dmo = ['sss', 'dd'];
