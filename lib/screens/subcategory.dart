import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/products.dart';
import 'package:gb_marketing/widgets/header.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SubCaterGoryView extends StatelessWidget {
  const SubCaterGoryView({Key? key}) : super(key: key);

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
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.85, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.to(() => ProductsView()),
                        child: Card(
                          color: Color(0xfffff2df),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          child: Column(
                            children: [
                              Expanded(child: Placeholder()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Txt(
                                  fsize: 12,
                                  text: 'Wooden',
                                  lines: 1,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
