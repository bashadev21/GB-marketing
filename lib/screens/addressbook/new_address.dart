import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text_field.dart';
import 'package:get/get.dart';

class NewAddressView extends StatelessWidget {
  final String isupdate, id;
  NewAddressView({Key? key, this.isupdate = '', this.id = ''})
      : super(key: key);
  final ProfileCon pcon = Get.find();
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
                    controller: pcon.aname,
                    hint: 'Full Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: pcon.adoor,
                    hint: 'Door No / Appartments / Building',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: pcon.astreet,
                    hint: 'Street / Colony / Village',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: pcon.aland,
                    hint: 'Landmark',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CTextField(
                          controller: pcon.acity,
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
                          controller: pcon.apincode,
                          hint: 'Pincode',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: pcon.astate,
                    hint: 'State',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CTextField(
                    controller: pcon.amobile,
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
            child: RaisedGradientButton(
                text: isupdate == 'yes' ? 'Update' : 'Add Address',
                onPressed: () {
                  if (pcon.aname.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Name Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.adoor.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Door No Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.astreet.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Street  Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.aland.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Landmark Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.acity.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'City Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.apincode.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Pincode Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.astate.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'State Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.amobile.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Mobile No Required',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.apincode.text.length != 6) {
                    Fluttertoast.showToast(
                      msg: 'Enter Valid pincode',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (pcon.amobile.text.length != 10) {
                    Fluttertoast.showToast(
                      msg: 'Enter valid Mobile',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else {
                    if (isupdate == 'yes') {
                      pcon.updateaddress(id);
                    } else {
                      pcon.addaddress();
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}
