import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:get/get.dart';

import 'text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool center;
  final bool backicon;
  final bool carticon;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  BaseAppBar(
      {Key? key,
      this.title = 'GB Marketing',
      this.center = true,
      this.backicon = false,
      this.carticon = false})
      : super(key: key);
  final CartCon ccon = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: center,
      title: Txt(
        text: title,
        color: Colors.white,
        weight: FontWeight.w500,
        defalutsize: true,
      ),
      actions: [
        if (carticon)
          IconButton(
            onPressed: () => Get.offAll(() => BottamBar(currentindex: 2)),
            icon: Stack(
              fit: StackFit.expand,
              children: [
                const Icon(
                  CupertinoIcons.shopping_cart,
                  size: 26.0,
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: ccon.cartlist.length.toString().length == 1
                              ? 8
                              : 11,
                          child: Text(
                            ccon.cartlist.length.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        )))
              ],
            ),
          ),
      ],
      leading: backicon
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ))
          : IconButton(
              icon: const Icon(
                Icons.sort,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      backgroundColor: Get.theme.primaryColor,
    );
  }
}
