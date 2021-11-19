import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:sizer/sizer.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

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
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.78, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blueGrey[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        child: Column(
                          children: [
                            Expanded(child: Placeholder()),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Txt(
                                fsize: 12,
                                text: 'Wooden',
                                lines: 1,
                                weight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              height: 1.5,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Txt(
                                fsize: 12,
                                text: 'Wooden',
                                color: Colors.grey,
                                lines: 1,
                                weight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
