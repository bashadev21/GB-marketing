import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/login.dart';
import 'package:gb_marketing/screens/product_details.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class ProductTile extends StatefulWidget {
  final prod;
  final bool isfav;
  ProductTile({Key? key, this.isfav = false, this.prod}) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  final HomeCon hcon = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (GetStorage().read('userid').toString() != 'null') {
          hcon.getproddetails(widget.prod['product_id']);
          Get.to(() => ProductDetailsView());
        } else {
          Fluttertoast.showToast(
            msg: 'Please Login!!!',
            backgroundColor: Colors.black54,
            textColor: Colors.white,
          );
          Get.offAll(() => LoginView());
        }
      },
      child: Stack(
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Expanded(
                      child: widget.prod['product_img'] == 'assets/images/' ||
                              widget.prod['product_img'] == ''
                          ? Container(
                              child: Image.asset('assets/logo.png'),
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  API().imagebase + widget.prod['product_img'],
                              placeholder: (context, url) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                text: widget.prod['product_name'],
                                fsize: 12,
                                weight: FontWeight.w500,
                                lines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Txt(
                                    text:
                                        'Save ₹${widget.prod['discount_price']}',
                                    fsize: 10,
                                    color: Colors.grey,
                                    lines: 2,
                                  ),
                                  Txt(
                                    text:
                                        ' (${widget.prod['discount_percent']}% OFF)',
                                    fsize: 9,
                                    color: Colors.red,
                                    weight: FontWeight.w500,
                                    lines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Txt(
                                        text: 'M.R.P. ',
                                        fsize: 11,
                                        color: Colors.pink,
                                        lines: 2,
                                      ),
                                      Text(
                                        '₹ ${widget.prod['slashed_price']}',
                                        style: TextStyle(
                                            color: Colors.pink,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      widget.prod['rating'] != '0'
                                          ? Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 12.sp,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Txt(
                                                  text: widget.prod['rating'],
                                                  fsize: 10,
                                                ),
                                              ],
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Txt(
                                        text: GetStorage()
                                                        .read('vendor')
                                                        .toString() ==
                                                    'null' ||
                                                GetStorage()
                                                        .read('vendor')
                                                        .toString() ==
                                                    'false'
                                            ? '₹ ${widget.prod['product_price']}'
                                            : '₹ ${widget.prod['vendor_price']}',
                                        fsize: 14,
                                        color: Colors.pink,
                                        weight: FontWeight.w500,
                                        lines: 2,
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (GetStorage()
                                              .read('userid')
                                              .toString() !=
                                          'null') {
                                        hcon.productadd(
                                            widget.prod['product_id'], 1);
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
                                      Icons.add_circle,
                                      size: 25.sp,
                                      color: Get.theme.primaryColorLight,
                                    ),
                                  )
                                ],
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
          ),
          Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: () {
                  if (GetStorage().read('userid').toString() != 'null') {
                    setState(() {
                      widget.prod['favourite_list'] == 'true'
                          ? widget.prod['favourite_list'] = 'false'
                          : widget.prod['favourite_list'] = 'true';
                      hcon.favaddremove(widget.prod['product_id']);
                    });
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Please Login!!!',
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                    );
                    Get.offAll(() => LoginView());
                  }
                },
                child: CircleAvatar(
                  child: Icon(
                    widget.prod['favourite_list'] == 'true'
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: Colors.red,
                  ),
                  radius: 15.sp,
                  backgroundColor: Colors.grey.withOpacity(0.8),
                ),
              ))
        ],
      ),
    );
  }
}
