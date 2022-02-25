import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Terms & Conditions',
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
                          text: 'Terms & Conditions',
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
                          "* We are dealing with entire South India i.e., Tamilnadu, Andhra Pradesh.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* We are doing delivery and fitting in the shops for free of cost in goods value around 50,000 Thousand above.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* Cash on Delivery only possible for new customers.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text: "* Goods once sold can\'t taken back.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* For any information relating to Warranty, Guarantee or Assurance. Kindly visit the product page on the platform.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* No deliveries through any courier or parcel service. In case of urgent deliveries, To Pay is applicable and we are not responsible for any transports for any transports damages.",
                      defalutsize: true,
                      color: Colors.grey,
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
