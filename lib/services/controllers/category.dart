import 'dart:convert';

import 'package:gb_marketing/screens/products.dart';
import 'package:gb_marketing/services/controllers/home.dart';

import '../../api_endpoints.dart';
import '../base_client.dart';
import 'package:get/get.dart';

class CatCon extends GetxController with BaseController {
  var allcategotylist = [].obs;
  var subcategotylist = [].obs;

  @override
  void onInit() {
    allcat();

    super.onInit();
  }

  void allcat() async {
    var response =
        await BaseClient().get(API().getallcat).catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    allcategotylist.value = data;
    print(allcategotylist);
  }

  void getsubcat(catid) async {
    final HomeCon hcon = Get.find();
    subcategotylist.clear();
    var body = {
      'functocall': API().getsubcat,
      'category_id': catid,
    };
    var response =
        await BaseClient().post(API().baseurl, body).catchError(handleError);
    if (response == null) return;

    print(response.toString());
    if (response == '[]' || response == '') {
      hcon.getpopcatprod(catid);
      Get.to(() => ProductsView(
            issub: true,
          ));
    } else {
      var data = json.decode(response);
      subcategotylist.value = data[0]['subcategory'];
    }
  }
}
