import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class CartCon extends GetxController with BaseController {
  var cartlist = [].obs;

  @override
  void onInit() {
    getcartlist();

    super.onInit();
  }

  void getcartlist() async {
    var body = {
      'functocall': API().getcartlist,
      'user_id': GetStorage().read('userid'),
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
}
