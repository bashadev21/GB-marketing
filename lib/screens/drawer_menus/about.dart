import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'About',
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
                  children: [
                    Row(
                      children: [
                        Txt(
                          text: 'About',
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
                          "GB Marketing is a furniture company that provides luxury finishing with the finest elaboration and quality. From the very beginning the group has focused on its core principles of customer services, quality value for money & innovation and the group continuously introduces new and high tech furniture. Furniture Products are manufactured from Malaysia & China and some of the product are own manufacturing of GB Marketing the vendors are most trusted from the industry.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Txt(
                          text: 'Service',
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
                          "* Our vendors make use of Grade Quality raw material like Wood, Glass, Metal and others for manufacturing the range of products.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* Our management provides Free Delivery & Fitting in all over Tamilnadu and Within 2 days in Chennai and 2 weeks in Tamilnadu.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "Customer satisfaction is our company ultimate goal, we are striving for establishing a famous brand and join hands with you to create and win glory.",
                      defalutsize: true,
                      color: Colors.black,
                      weight: FontWeight.bold,
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
