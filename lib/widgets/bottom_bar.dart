import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:animations/animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/screens/dashboard/cart.dart';
import 'package:gb_marketing/screens/dashboard/category.dart';
import 'package:gb_marketing/screens/dashboard/home.dart';
import 'package:gb_marketing/screens/dashboard/profile.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

import 'drawer.dart';
import 'header.dart';

// ignore: must_be_immutable
class BottamBar extends StatefulWidget {
  int currentindex;
  BottamBar({Key? key, required this.currentindex}) : super(key: key);

  @override
  State<BottamBar> createState() => _BottamBarState();
}

class _BottamBarState extends State<BottamBar> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CategoryView(),
    CartView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.currentindex = index;
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: 'Press back button again to Exit!',
          backgroundColor: Colors.black54);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Upgrader().clearSavedSettings();
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: const BaseAppBar(),
        drawer: DrawerWidget(),
        body: UpgradeAlert(
          debugLogging: true,
          dialogStyle: GetPlatform.isIOS
              ? UpgradeDialogStyle.cupertino
              : UpgradeDialogStyle.material,
          child: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 800),
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: _widgetOptions.elementAt(widget.currentindex),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 4,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  shape: BadgeShape.circle,
                  borderRadius: BorderRadius.circular(100),
                  child: Icon(CupertinoIcons.shopping_cart),
                  badgeContent: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_fill),
                label: 'Profile',
              ),
            ],
            currentIndex: widget.currentindex,
            selectedItemColor: Get.theme.primaryColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
