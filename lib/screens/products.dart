import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:get/get.dart';

class ProductsView extends StatelessWidget {
  ProductsView({Key? key}) : super(key: key);
  final HomeCon hcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          backicon: true,
          title: 'Products',
          carticon: true,
        ),
        body: Obx(
          () => GridView.builder(
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
