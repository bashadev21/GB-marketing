import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/end_drawer.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';

class ProductsView extends StatelessWidget {
  final bool issub;
  ProductsView({Key? key, this.issub = false}) : super(key: key);
  final HomeCon hcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: EndDrawerWidget(),
        appBar: BaseAppBar(
          backicon: true,
          title: 'Products',
          carticon: true,
          ontap: () {
            issub ? Get.offAll(() => BottamBar(currentindex: 1)) : Get.back();
          },
        ),
        body: Obx(
          () => hcon.catproductlist.length == 0
              ? Center(
                  child: Txt(
                    text: 'No Products Found',
                  ),
                )
              : GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: hcon.catproductlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductTile(
                      prod: hcon.catproductlist[index],
                    );
                  },
                ),
        ));
  }
}
