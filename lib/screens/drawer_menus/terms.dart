import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';

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
    );
  }
}
