import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/product_tile.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Wishlist',
        carticon: true,
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ProductTile(
            isfav: true,
          );
        },
      ),
    );
  }
}
