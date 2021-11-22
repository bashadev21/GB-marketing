import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gb_marketing/screens/my_orders.dart';
import 'package:gb_marketing/services/controllers/auth.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sizer/sizer.dart';

import 'screens/login.dart';
import 'services/controllers/zoom_image.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
  Get.put(AuthCon());
  Get.put(ZoomCon());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.lightBlue));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        defaultTransition: Transition.cupertino,
        title: 'GB Marketing',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[50],
            primaryColorLight: Colors.blueAccent,
            primaryColor: Colors.lightBlue),
        home: LoginView(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
