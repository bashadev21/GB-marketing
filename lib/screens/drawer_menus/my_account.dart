import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'My Account',
        carticon: true,
      ),
    );
  }
}
