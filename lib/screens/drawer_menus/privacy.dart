import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';

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
    );
  }
}
