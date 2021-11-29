import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gb_marketing/services/controllers/profile.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get_storage/get_storage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class CartCon extends GetxController with BaseController {
  var cartlist = [].obs;
  var razorcred = [].obs;
  var checklist = [].obs;
  var totalamount = ''.obs;
  var name = '0'.obs;
  var door = '0'.obs;
  var street = '0'.obs;
  var city = '0'.obs;
  var land = '0'.obs;
  var state = '0'.obs;
  var mobile = '0'.obs;
  var shipping = '0'.obs;
  var days = '0'.obs;
  var msg = '0'.obs;
  var pincode = '0'.obs;
  var addressid = '0'.obs;
  var couponidvar = '0'.obs;
  var discount = '0'.obs;
  var onlinepay = false.obs;
  var singleprodid = ''.obs;
  var singleqty = ''.obs;
  var couponcode = ''.obs;
  var codpay = false.obs;

  late Razorpay _razorpay;
  @override
  void onInit() {
    if (GetStorage().read('userid').toString() != 'null') {
      getcartlist();
      checkoutaddres();
    }
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    var grandtotal = int.parse(totalamount.value).round() +
        int.parse(shipping.value).round();

    payment(response.orderId!.toString(), response.paymentId!.toString(),
        response.signature!.toString(), grandtotal.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Payment Failed', toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void getcartlist() async {
    var body = {
      'functocall': API().getcartlist,
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      cartlist.value = data;
    }
  }

  void payment(
    orderid,
    payid,
    signid,
    orderprice, {
    productid = '',
    quantity = '',
    couponid = '',
  }) async {
    showLoading();
    var body = {
      'razorpay_order_id': orderid,
      'razorpay_payment_id': payid,
      'razorpay_signature': signid,
      'order_price': orderprice.toString(),
      'product_id': singleprodid.value.toString(),
      'quantity': singleqty.value.toString(),
      'coupon_id': couponidvar.value.toString(),
      'addr_id': GetStorage().read('lastadr').toString(),
      'user_id': GetStorage().read('userid').toString(),
      'user_type': GetStorage().read('vendor').toString() == 'true'
          ? 'vendor'
          : 'customer',
    };
    print('bodyyyyy' + body.toString());
    var response = await BaseClient()
        .post(API().completepaymenturl, body)
        .catchError(handleError);
    if (response == null) return;
    if (response.toString().trim() == 'Payment Completed Successfully!') {
      singleprodid.value = '';
      singleqty.value = '';
      hideLoading();
      final ProfileCon pcon = Get.find();
      pcon.myorders();
      getcartlist();
      Get.dialog(Center(
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                height: 30.h,
                width: 80.w,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        color: Colors.green,
                        size: 50.sp,
                      ),
                      Txt(
                        iscenter: true,
                        defalutsize: true,
                        text: 'Order Placed Succussfully!',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            child: RaisedGradientButton(
                                text: 'Done',
                                onPressed: () {
                                  Get.offAll(() => BottamBar(currentindex: 0));
                                }),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              )),
            ],
          ),
        ),
      ));
    } else {
      hideLoading();
      Fluttertoast.showToast(
        msg: response.toString(),
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    print(response.toString());
  }

  void codpayment(
    orderprice, {
    productid = '',
    quantity = '',
    couponid = '',
  }) async {
    showLoading();
    var body = {
      'functocall': 'cod',
      'order_price': orderprice.toString(),
      'product_id': singleprodid.value.toString(),
      'quantity': singleqty.value.toString(),
      'coupon_id': couponidvar.value.toString(),
      'addr_id': GetStorage().read('lastadr').toString(),
      'user_id': GetStorage().read('userid').toString(),
      'user_type': GetStorage().read('vendor').toString() == 'true'
          ? 'vendor'
          : 'customer',
    };
    print('bodyyyyy' + body.toString());
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;
    print('hell' + response.toString());
    // if (response.toString().trim() == 'Order Placed') {
    singleprodid.value = '';
    singleqty.value = '';
    hideLoading();
    final ProfileCon pcon = Get.find();
    pcon.myorders();
    getcartlist();
    Get.dialog(Center(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
              height: 30.h,
              width: 80.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green,
                      size: 50.sp,
                    ),
                    Txt(
                      iscenter: true,
                      defalutsize: true,
                      text: 'Order Placed Succussfully!',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: RaisedGradientButton(
                              text: 'Done',
                              onPressed: () {
                                Get.offAll(() => BottamBar(currentindex: 0));
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
            )),
          ],
        ),
      ),
    ));
    couponidvar.value = '0';
    // } else {
    //   hideLoading();
    //   Fluttertoast.showToast(
    //     msg: response.toString(),
    //     toastLength: Toast.LENGTH_LONG,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //   );
    // }
    print(response.toString());
  }

  void addsum() {
    var cashlist = <int>[];
    cartlist.forEach((e) {
      if (GetStorage().read('vendor').toString() == 'null' ||
          GetStorage().read('vendor').toString() == 'false') {
        cashlist.add(int.parse(e['product_price']) * int.parse(e['quantity']));
      } else {
        cashlist.add(int.parse(e['vendor_price']) * int.parse(e['quantity']));
      }
    });

    var total = cashlist.sum;
    totalamount.value = total.toString();
  }

  void getrazorpay(price) async {
    showLoading();
    var body = {
      'order_price': price.toString(),
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().paymenturl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      hideLoading();
      var data = json.decode(response);
      razorcred.value = data;
      openCheckout();
    }
  }

  void applycoupon(coupon) async {
    showLoading();
    var body = {
      'functocall': API().couponapply,
      'coupon_code': coupon,
      'user_id': GetStorage().read('userid').toString(),
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    hideLoading();
    if (response != '[]' || response != '') {
      hideLoading();
      var data = json.decode(response);
      if (data[0]['msg'] == 'yes') {
        couponidvar.value = data[1]['coupon_id'].toString();
        if (data[1]['percent'] == '0') {
          discount.value =
              int.parse(data[1]['rs']).round().toString().split('.')[0];
          // totalamount.value =
          //     ((int.parse(totalamount.value) - ))
          //         .round()
          //         .toString();
          Fluttertoast.showToast(
            msg: 'Applied Successfully',
            backgroundColor: Colors.green[400],
            textColor: Colors.white,
          );
        } else {
          discount.value = (int.parse(totalamount.value) /
                  100 *
                  int.parse(data[1]['percent']))
              .toString()
              .split('.')[0];
          Fluttertoast.showToast(
            msg: 'Applied Successfully',
            backgroundColor: Colors.green[400],
            textColor: Colors.white,
          );
          // totalamount.value = ((int.parse(totalamount.value) / 100) *
          //         int.parse(data[1]['percent']))
          //     .round()
          //     .toString();
          print(discount.value.toString());
        }
      } else {
        Fluttertoast.showToast(
          msg: 'Coupon code not valid',
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
        );
      }
    }
  }

  void openCheckout() async {
    var options = razorcred[0];

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void checkoutaddres() async {
    var body = {
      'functocall': API().checkoutaddress,
      'user_id': GetStorage().read('userid').toString(),
      'address_id': GetStorage().read('lastadr').toString() == 'null'
          ? '0'
          : GetStorage().read('lastadr').toString()
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response != '[]' || response != '') {
      var data = json.decode(response);
      checklist.value = data;
      shipping.value = checklist[0]['charge_and_days'][0]['charge'];
      name.value = checklist[0]['fullname'];
      door.value = checklist[0]['doorno'];
      mobile.value = checklist[0]['mobile_no'];
      street.value = checklist[0]['street'];
      pincode.value = checklist[0]['pincode'];
      state.value = checklist[0]['state'];
      city.value = checklist[0]['city'];
      land.value = checklist[0]['landmark'];
      addressid.value = checklist[0]['useraddress_id'];
      msg.value = checklist[0]['charge_and_days'][0]['msg'];
      days.value = checklist[0]['charge_and_days'][0]['days'];
    }
  }
}
