import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class NeedHelpView extends StatelessWidget {
  const NeedHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    openwhatsapp(num) async {
      var whatsapp = "+91$num";
      var whatsappURl_android = "whatsapp://send?phone=" + whatsapp + "&text=";
      var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunch(whatappURL_ios)) {
          await launch(whatappURL_ios, forceSafariVC: false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));
        }
      } else {
        // android , web
        if (await canLaunch(whatsappURl_android)) {
          await launch(whatsappURl_android);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));
        }
      }
    }

    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Need Help',
        carticon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Txt(
                          text: 'Need Help?',
                          defalutsize: true,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "If you have any questions about this privacy policy,the practices of platform or your dealings with the websites.You can contact us via the links at the bottom of the page",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Txt(
                          text: 'GB Marketing',
                          defalutsize: true,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text: "32, Anna Salai,Nagalkeni,Pammal,",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Txt(
                      text: "Chennai - 600075.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Txt(
                      text: "Tamil Nadu, India.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Txt(
                      text: "Mon - Sat: 10 am - 6 pm | Sun: 12pm - 2 pm",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Txt(
                      text: "Phone - +91 44 2248 3755 / 56",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "However, for any product or services related complaint or query, please contact us.",
                      defalutsize: true,
                      weight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        openwhatsapp(9384055387);
                      },
                      leading: Image.asset(
                        'assets/whatsapp_logo_PNG2.png',
                        height: 40,
                      ),
                      title: Txt(
                        text: '9384055387',
                        defalutsize: true,
                        weight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        openwhatsapp(9384055390);
                      },
                      leading: Image.asset(
                        'assets/whatsapp_logo_PNG2.png',
                        height: 40,
                      ),
                      title: Txt(
                        text: '9384055390',
                        defalutsize: true,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
