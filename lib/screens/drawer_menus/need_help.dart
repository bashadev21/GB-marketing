import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/header.dart';

class NeedHelpView extends StatelessWidget {
  const NeedHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Need Help',
        carticon: true,
      ),
    );
  }
}
