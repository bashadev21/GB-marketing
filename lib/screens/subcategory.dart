import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/products.dart';
import 'package:gb_marketing/services/controllers/category.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../api_endpoints.dart';

class SubCaterGoryView extends StatelessWidget {
  SubCaterGoryView({Key? key}) : super(key: key);
  final CatCon ccon = Get.find();
  final HomeCon hcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backicon: true,
        title: 'Sub Categories',
        carticon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Txt(
                    text: 'Select Subcategory',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Obx(() => GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ccon.subcategotylist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.85, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final cat = ccon.subcategotylist[index];
                      return InkWell(
                        onTap: () {
                          hcon.getpopcatprod(cat['sub_cate_id'],
                              paramn: 'sub_categoryid');
                          Get.to(() => ProductsView());
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          child: Column(
                            children: [
                              Expanded(
                                  child: CachedNetworkImage(
                                imageUrl: API().imagebase + cat['image'],
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )),
                              Container(
                                color: Color(0xfffff2df),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Txt(
                                              fsize: 12,
                                              text: cat['sub_cate_name'],
                                              lines: 2,
                                              iscenter: true,
                                              weight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
