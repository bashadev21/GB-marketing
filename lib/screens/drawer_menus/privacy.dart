import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Privacy Policy',
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
                          text: 'Privacy Policy',
                          defalutsize: true,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          """Welcome to www.gbmarketing.co.in, the website and online service of GB Marketing Furniture Company (“we”,“our” or “us”). We respect the privacy of our users and we are committed to protecting it through our compliance with this privacy policy, which describes the types of information we may collect from you or that you may provide when you use our www.gbmarketing.co.in website (“Website”), or our services (collectively, “Services”) and our practices for collecting, using, maintaining, protecting and disclosing that information. Here are our privacy principles:""",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                text: 'What does this Privacy Policy Cover?',
                                defalutsize: true,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text: "Providing information to us is your choice.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "you can choose to have the Personal Information provided by you deleted.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "You always have the ability to opt-out of receiving communications from us.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                text:
                                    'This Privacy Policy applies to information we collect:',
                                defalutsize: true,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* In email, text and other electronic messages between you and us.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* When and where available,through mpbile and desktop applications, which provide dedicated non-browser-based interaction between you and us.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* When you interact with our advertising and applications on third-party websites and services, if thise applications or advertising include links to this ploicy.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          """"* Which you provide to us,such as your name and e-mail address, if you register for www.gbmarketing.co.in (including by "following," "liking,"linking you account to www.gbmarketing.co.in. etc., ona third party website or network).""",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "* You understand, agree and acknowledge that our collection, storage and processing of your Personal Information is for a lawful purpose connected with a function or a activity of the Platform Entities and its joint ventures. You further understand, agree and acknowledge that your Personal Information ehich is classified as sensitive personal information as per applicable laws is considered necessary fo the Platform to provide various services on its Websites to You and for Your usage of the Website and other services provided by Platform in relation to the Website.",
                      defalutsize: true,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                text: 'Changes in Privcay Policy',
                                defalutsize: true,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Txt(
                      text:
                          "From time to time we may update this Privacy Policy. Your continued subscription to our Services constitutes an acceptence of the then-current Privay Policy and Terms of Use so we encourage You to visit this page periodically to review any changes",
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
