import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Contact Us',
        carticon: true,
      ),
    );
  }
}
