import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/addressbook/all_address.dart';
import 'package:gb_marketing/widgets/profile_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../change_password.dart';
import '../my_orders.dart';
import '../wishlist.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Center(
              child: Txt(
                text: 'Profile',
                weight: FontWeight.w500,
              ),
            ),
          ),
          ProfileTile(
            icon: CupertinoIcons.bag_fill,
            onTap: () => Get.to(() => MyOrdersView()),
            title: 'My Orders',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileTile(
            icon: CupertinoIcons.heart_fill,
            color: Colors.red,
            onTap: () => Get.to(() => WishlistView()),
            title: 'Wishlist',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileTile(
            icon: CupertinoIcons.building_2_fill,
            onTap: () => Get.to(() => AddressView()),
            title: 'Address Book',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileTile(
            icon: CupertinoIcons.lock_rotation,
            onTap: () => Get.to(() => ChangePassView()),
            title: 'Change Password',
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: CupertinoButton(
                    color: Colors.red,
                    child: Txt(
                      text: 'Sign  Out',
                      defalutsize: true,
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
