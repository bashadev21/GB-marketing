import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text_field.dart';

class NewAddressView extends StatelessWidget {
  NewAddressView({Key? key}) : super(key: key);
  final TextEditingController c1 = new TextEditingController();
  final TextEditingController c2 = new TextEditingController();
  final TextEditingController c3 = new TextEditingController();
  final TextEditingController c4 = new TextEditingController();
  final TextEditingController c5 = new TextEditingController();
  final TextEditingController c6 = new TextEditingController();
  final TextEditingController c7 = new TextEditingController();
  final TextEditingController c8 = new TextEditingController();
  final TextEditingController c9 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        backicon: true,
        title: 'Add Address',
        carticon: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CTextField(
                    controller: c1,
                    hint: 'Full Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: c2,
                    hint: 'Door No / Appartments / Building',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: c3,
                    hint: 'Street / Colony / Village',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: c4,
                    hint: 'Landmark',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CTextField(
                          controller: c5,
                          hint: 'City / Town',
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: CTextField(
                          keyboard: TextInputType.number,
                          max: 6,
                          controller: c6,
                          hint: 'Pincode',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: c8,
                    hint: 'State',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: c9,
                    max: 10,
                    keyboard: TextInputType.number,
                    hint: 'Mobile',
                  ),
                  if (MediaQuery.of(context).viewInsets.bottom != 0)
                    SizedBox(
                      height: 200,
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedGradientButton(text: 'Add Address', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
