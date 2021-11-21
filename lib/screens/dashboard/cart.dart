import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/cart_tile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../checkout.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

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
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CartTile(),
                        index == 3
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
                                      text: '₹50000',
                                      weight: FontWeight.w500,
                                      fsize: 13,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox()
                      ],
                    );
                  }),
            ),
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
