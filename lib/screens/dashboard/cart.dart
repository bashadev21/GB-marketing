import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/widgets/cart_tile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:collection/collection.dart';
import '../checkout.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  final CartCon ccon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0.sp),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Center(
                child: Txt(
                  text: 'Cart',
                  weight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: ccon.cartlist.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var cashlist = <int>[];
                    ccon.cartlist.forEach((e) {
                      cashlist.add(int.parse(e['product_price']) *
                          int.parse(e['quantity']));
                    });
                    var total = cashlist.sum;
                    ccon.totalamount.value = total.toString();
                    return Column(
                      children: [
                        CartTile(
                          cart: ccon.cartlist[index],
                        ),
                        index == ccon.cartlist.length - 1
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Txt(
                                      text: 'Total: ',
                                      color: Colors.grey,
                                      fsize: 13,
                                    ),
                                    Txt(
                                      text: '₹ ${total.toString()}',
                                      weight: FontWeight.bold,
                                      fsize: 13,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox()
                      ],
                    );
                  }),
            )),
            Container(
              height: kBottomNavigationBarHeight + 5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedGradientButton(
                    text: 'Proceed to Checkout',
                    onPressed: () => Get.to(() => CheckOutView())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
