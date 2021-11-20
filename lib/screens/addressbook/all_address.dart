import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';

import 'new_address.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Address Book',
        carticon: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Txt(
                                  text: 'Demo',
                                  fsize: 13,
                                  weight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(CupertinoIcons.pencil),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(CupertinoIcons.delete),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Txt(
                                        text: 'Demo Address Comes Here' * 3,
                                        weight: FontWeight.w500,
                                        fsize: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Txt(
                                  text: 'Landmark - ',
                                  color: Colors.grey,
                                  fsize: 11,
                                ),
                                Txt(
                                  text: 'Near Post Office',
                                  fsize: 12,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Txt(
                                  text: 'Contact    - ',
                                  color: Colors.grey,
                                  fsize: 11,
                                ),
                                Txt(
                                  text: '987654321',
                                  fsize: 12,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            height: kBottomNavigationBarHeight + 5,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * .75,
                    child: RaisedGradientButton(
                        addicon: true,
                        text: 'Add New Address',
                        onPressed: () => Get.to(() => NewAddressView())),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
