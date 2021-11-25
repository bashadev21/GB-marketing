import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/addressbook/all_address.dart';
import 'package:gb_marketing/screens/login.dart';
import 'package:gb_marketing/widgets/profile_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
            onTap: () {
              Get.to(() => WishlistView());
            },
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
                    onPressed: () {
                      Get.dialog(Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Container(
                              height: 150,
                              width: Get.width * .80,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Txt(
                                      text: 'Are you sure want to Signout?',
                                      weight: FontWeight.w500,
                                      color: Colors.grey,
                                      defalutsize: true,
                                      iscenter: true,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            GetStorage().remove('userid');
                                            GetStorage().remove('username');
                                            GetStorage().remove('vendor');
                                            Get.offAll(() => LoginView());
                                          },
                                          child: Txt(
                                            text: 'YES',
                                            defalutsize: true,
                                            color: Colors.red,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        InkWell(
                                          onTap: () => Get.back(),
                                          child: Txt(
                                            text: 'NO',
                                            defalutsize: true,
                                            color: Colors.green,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ));
                    }),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
