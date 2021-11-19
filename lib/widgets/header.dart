import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool center;
  final bool backicon;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const BaseAppBar(
      {Key? key,
      this.title = 'GB Marketing',
      this.center = true,
      this.backicon = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: center,
      title: Txt(
        text: title,
        color: Colors.white,
        defalutsize: true,
      ),
      leading: backicon
          ? const BackButton()
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
