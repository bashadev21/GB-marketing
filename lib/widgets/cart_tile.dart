import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/product_details.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import '../api_endpoints.dart';
import 'text.dart';

class CartTile extends StatelessWidget {
  final cart;
  CartTile({Key? key, this.cart}) : super(key: key);
  HomeCon hcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        hcon.getproddetails(cart['product_id']);
        Get.to(() => ProductDetailsView());
      },
      child: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 75.sp,
                      width: 75.sp,
                      child: cart['product_img'] == ''
                          ? Container(
                              child: Image.asset('assets/logo.png'),
                            )
                          : CachedNetworkImage(
                              imageUrl: API().imagebase + cart['product_img'],
                              placeholder: (context, url) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  text: cart['product_name'],
                                  fsize: 13,
                                  lines: 2,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    hcon.productdelete(cart['temp_id']);
                                  },
                                  child: Icon(CupertinoIcons.delete))
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Txt(
                              text: 'M.R.P. ',
                              fsize: 11,
                              color: Colors.grey,
                            ),
                            Text(
                              '₹ ${cart['slashed_price']}',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Txt(
                              text: GetStorage().read('vendor').toString() ==
                                          'null' ||
                                      GetStorage().read('vendor').toString() ==
                                          'false'
                                  ? '₹ ${cart['product_price']}'
                                  : '₹ ${cart['vendor_price']}',
                              fsize: 12,
                              color: Colors.pink,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (cart['quantity'] != '1') {
                                    var qty = int.parse(cart['quantity']) - 1;
                                    hcon.productadd(cart['product_id'], qty);
                                  } else {
                                    hcon.productdelete(cart['temp_id']);
                                  }
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Txt(
                                text: cart['quantity'],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  if (cart['quantity'] != '10') {
                                    var qty = int.parse(cart['quantity']) + 1;
                                    hcon.productadd(cart['product_id'], qty);
                                  }
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Txt(
                                text: GetStorage().read('vendor').toString() ==
                                            'null' ||
                                        GetStorage()
                                                .read('vendor')
                                                .toString() ==
                                            'false'
                                    ? '₹ ${int.parse(cart['product_price']) * int.parse(cart['quantity'])}'
                                    : '₹ ${int.parse(cart['vendor_price']) * int.parse(cart['quantity'])}',
                                fsize: 13,
                                color: Colors.black,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
