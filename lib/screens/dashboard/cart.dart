import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/widgets/cart_tile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
                  weight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => ccon.cartlist.length == 0
                  ? Center(
                      child: Txt(
                      text: 'Your Cart is empty',
                    ))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ccon.cartlist.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        ccon.addsum();
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
                                          text:
                                              '₹ ${ccon.totalamount.toString()}',
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
            Obx(() => ccon.cartlist.length != 0
                ? Container(
                    height: kBottomNavigationBarHeight + 5,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedGradientButton(
                          text: 'Proceed to Checkout',
                          onPressed: () => Get.to(() => CheckOutView())),
                    ),
                  )
                : SizedBox())
          ],
        ),
      ),
    );
  }
}
