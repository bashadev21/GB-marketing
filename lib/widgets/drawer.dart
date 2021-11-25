import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/drawer_menus/about.dart';
import 'package:gb_marketing/screens/drawer_menus/contact.dart';
import 'package:gb_marketing/screens/drawer_menus/need_help.dart';
import 'package:gb_marketing/screens/drawer_menus/privacy.dart';
import 'package:gb_marketing/screens/drawer_menus/terms.dart';
import 'package:gb_marketing/screens/login.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/drawer_tile.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final HomeCon hcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Get.theme.primaryColorLight,
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.sp,
                    ),
                    Container(
                      height: 80.sp,
                      child: Center(
                          child: Image.asset(
                        'assets/logo.png',
                      )),
                    ),
                    Container(
                      height: 50.sp,
                      child: Row(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Txt(
                              text: 'Hi,',
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                text:
                                    GetStorage().read('username').toString() ==
                                            'null'
                                        ? 'Guest'
                                        : GetStorage().read('username'),
                                weight: FontWeight.w500,
                                lines: 2,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              height: 150.sp,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            SizedBox(
              height: 5,
            ),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                  Get.back();
                  if (GetStorage().read('userid').toString() != 'null') {
                    Get.offAll(() => BottamBar(
                          currentindex: 3,
                        ));
                  } else {
                    Get.offAll(() => LoginView());
                  }
                },
                title: 'My Account',
                icon: Icons.person),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                  Get.back();
                  Get.to(() => AboutView());
                },
                title: 'About',
                icon: Icons.feedback),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                  Get.back();
                  Get.to(() => NeedHelpView());
                },
                title: 'Need Help?',
                icon: Icons.help),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                  Get.back();
                  Get.to(() => TermsView());
                },
                title: 'Terms & Conditions',
                icon: Icons.notes),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                  Get.back();
                  Get.to(() => PrivacyView());
                },
                title: 'Privacy Policy',
                icon: Icons.privacy_tip),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                  Get.back();
                  Get.to(() => ContactView());
                },
                title: 'Contact Us',
                icon: Icons.contact_mail),
            DrawerTile(
                onTap: () {
                  hcon.searchc.clear();
                  hcon.searchlist.clear();
                  hcon.showclear.value = false;
                },
                title: 'Share App',
                icon: Icons.share),
          ],
        ),
      ),
    );
  }
}
