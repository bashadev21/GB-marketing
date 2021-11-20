import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';

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
    );
  }
}
