import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';

class WishlistView extends StatelessWidget {
  WishlistView({Key? key}) : super(key: key);
  final ProfileCon pcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Wishlist',
        carticon: true,
      ),
      body: Obx(() => pcon.favlist.length == 0
          ? Center(
              child: Txt(
                text: 'No Products Found',
              ),
            )
          : GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: pcon.favlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductTile(
                  isfav: true,
                  prod: pcon.favlist[index],
                );
              },
            )),
    );
  }
}
