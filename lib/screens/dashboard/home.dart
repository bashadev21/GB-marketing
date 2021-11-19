import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/search_bar.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sp),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    height: 150.sp,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Placeholder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      color: Colors.white,
                      height: 40.sp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(
                            text: 'Popular Categories',
                            fsize: 12,
                            weight: FontWeight.w500,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.offAll(() => BottamBar(currentindex: 1)),
                            child: Txt(
                              text: 'View All',
                              fsize: 12,
                              color: Colors.red,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GridView.builder(
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Expanded(child: Placeholder()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Txt(
                                  fsize: 12,
                                  text: 'Wooden',
                                  lines: 2,
                                  weight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          color: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
