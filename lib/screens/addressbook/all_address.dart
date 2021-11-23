import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';

import 'new_address.dart';

class AddressView extends StatelessWidget {
  AddressView({
    Key? key,
  }) : super(key: key);
  final ProfileCon pcon = Get.find();
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
              child: Obx(
            () => ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: pcon.addresslist.length,
                itemBuilder: (context, index) {
                  final address = pcon.addresslist[index];
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
                                  text: address['fullname'],
                                  fsize: 13,
                                  weight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        pcon.aname.text = address['fullname'];
                                        pcon.adoor.text = address['doorno'];
                                        pcon.astreet.text = address['street'];
                                        pcon.amobile.text =
                                            address['mobile_no'];
                                        pcon.apincode.text = address['pincode'];
                                        pcon.acity.text = address['city'];
                                        pcon.astate.text = address['state'];
                                        pcon.aland.text = address['landmark'];

                                        Get.to(() => NewAddressView(
                                              isupdate: 'yes',
                                              id: address['useraddress_id'],
                                            ));
                                      },
                                      child: Container(
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
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.dialog(Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              child: Container(
                                                height: 150,
                                                width: 280,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Txt(
                                                        text:
                                                            'Are you sure want to Delete?',
                                                        weight: FontWeight.w500,
                                                        color: Colors.grey,
                                                        defalutsize: true,
                                                        iscenter: true,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              pcon.deleteaddress(
                                                                  address[
                                                                      'useraddress_id']);
                                                            },
                                                            child: Txt(
                                                              text: 'YES',
                                                              defalutsize: true,
                                                              color: Colors.red,
                                                              weight: FontWeight
                                                                  .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          InkWell(
                                                            onTap: () =>
                                                                Get.back(),
                                                            child: Txt(
                                                              text: 'NO',
                                                              defalutsize: true,
                                                              color:
                                                                  Colors.green,
                                                              weight: FontWeight
                                                                  .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(CupertinoIcons.delete),
                                          )),
                                    )
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
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Txt(
                                                  text: address['doorno'] +
                                                      ' , ' +
                                                      address['street'],
                                                  weight: FontWeight.w500,
                                                  fsize: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Txt(
                                            text: address['city'] + ' , ',
                                            weight: FontWeight.w500,
                                            fsize: 12,
                                          ),
                                          Txt(
                                            text: address['pincode'],
                                            weight: FontWeight.w500,
                                            fsize: 12,
                                          ),
                                        ],
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Txt(
                                        text: address['state'],
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
                                  text: address['landmark'],
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
                                  text: address['mobile_no'],
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
          )),
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
