import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/cart.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool center;
  final bool backicon;
  final bool carticon;
  final bool ismoreicon;
  final VoidCallback ontap;
  static _defaultFunction() {
    Get.back();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  BaseAppBar(
      {Key? key,
      this.title = 'GB Marketing',
      this.center = true,
      this.backicon = false,
      this.ontap = _defaultFunction,
      this.ismoreicon = false,
      this.carticon = false})
      : super(key: key);
  final CartCon ccon = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: center,
      title: InkWell(
        onTap: () {
          print(GetStorage().read('vendor'));
        },
        child: Txt(
          text: title,
          color: Colors.white,
          weight: FontWeight.bold,
          defalutsize: true,
        ),
      ),
      actions: [
        carticon
            ? GetStorage().read('userid').toString() != 'null'
                ? Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            Get.offAll(() => BottamBar(currentindex: 2)),
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
                                      radius: ccon.cartlist.length
                                                  .toString()
                                                  .length ==
                                              1
                                          ? 9
                                          : 9,
                                      child: Text(
                                        GetStorage()
                                                    .read('userid')
                                                    .toString() ==
                                                'null'
                                            ? '0'
                                            : ccon.cartlist.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ccon.cartlist.length
                                                        .toString()
                                                        .length ==
                                                    1
                                                ? 16
                                                : 9,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )))
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.offAll(() => BottamBar(currentindex: 0)),
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ],
                  )
                : Row(
                    children: [
                      // IconButton(
                      //     onPressed: () =>
                      //         Get.offAll(() => BottamBar(currentindex: 0)),
                      //     icon: Icon(
                      //       Icons.home,
                      //       color: Colors.white,
                      //     )),
                      IconButton(
                          onPressed: () => Scaffold.of(context).openEndDrawer(),
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ],
                  )
            : Row(
                children: [
                  IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )),
                ],
              ),
      ],
      leading: backicon
          ? IconButton(
              onPressed: ontap,
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
