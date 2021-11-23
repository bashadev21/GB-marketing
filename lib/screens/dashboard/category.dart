import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/subcategory.dart';
import 'package:gb_marketing/services/controllers/category.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../api_endpoints.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);
  final CatCon ccon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.sp),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Center(
                child: Txt(
                  text: 'Categories',
                  weight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Txt(
                    text: 'Select Category',
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Obx(() => GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ccon.allcategotylist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.78, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final cat = ccon.allcategotylist[index];
                      return InkWell(
                        onTap: () {
                          ccon.getsubcat(cat['category_id']);
                          Get.to(() => SubCaterGoryView());
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
                                color: Colors.blueGrey[50],
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Txt(
                                              fsize: 12,
                                              text: cat['category_name'],
                                              lines: 1,
                                              weight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.5,
                                color: Colors.white,
                              ),
                              Container(
                                color: Colors.blueGrey[50],
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Txt(
                                              fsize: 12,
                                              text: cat['cat_description'],
                                              color: Colors.grey,
                                              lines: 2,
                                              iscenter: true,
                                              weight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
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
