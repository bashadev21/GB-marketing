import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/products.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/services/controllers/zoom_image.dart';
import 'package:gb_marketing/widgets/bottom_bar.dart';
import 'package:gb_marketing/widgets/product_tile.dart';
import 'package:gb_marketing/widgets/search_bar.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:gb_marketing/widgets/zoom_image.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../api_endpoints.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeCon hcon = Get.find();
  final ZoomCon zcon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => SearchBar(
                con: hcon.searchc,
                showclear: hcon.showclear.value,
                onsubmit: (val) {
                  // hcon.searchmovie(val);

                  ///for storing last search into the local storage
                },
                onchange: (val) {
                  if (hcon.searchc.text.length != 0) {
                    hcon.showclear.value = true;
                    hcon.serachprod();
                  } else {
                    hcon.showclear.value = false;
                  }
                },
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sp),
              child: Stack(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Obx(
                        () => Container(
                            height: 150.sp,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 2,
                              child: Swiper(
                                autoplay: true,
                                duration: 1200,
                                onTap: (o) {
                                  zcon.selectedPageIndex.value = o;
                                  Get.to(
                                      () => ZoomImage(imgs: hcon.bannerlist));
                                },
                                autoplayDelay: 2000,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: EdgeInsets.all(4.0.sp),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: API().imagebase +
                                              hcon.bannerlist[index]['image'],
                                          placeholder: (context, url) =>
                                              Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ));
                                },
                                itemCount: hcon.bannerlist.length,
                                pagination: new SwiperPagination(),
                              ),
                            )),
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
                                onTap: () => Get.offAll(
                                    () => BottamBar(currentindex: 1)),
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
                      Obx(
                        () => GridView.builder(
                            itemCount: hcon.popcategotylist.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              final cat = hcon.popcategotylist[index];
                              return InkWell(
                                onTap: () {
                                  hcon.getpopcatprod(hcon.popcategotylist[index]
                                      ['category_id']);
                                  Get.to(() => ProductsView());
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: CachedNetworkImage(
                                        imageUrl:
                                            API().imagebase + cat['image'],
                                        placeholder: (context, url) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey.withOpacity(0.2),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/placeholder.jpeg'),
                                      )),
                                      Container(
                                        color: Colors.blueGrey[50],
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Txt(
                                                            fsize: 12,
                                                            text: cat[
                                                                'category_name'],
                                                            lines: 2,
                                                            iscenter: true,
                                                            weight:
                                                                FontWeight.w500,
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
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 2,
                                ),
                              );
                            }),
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
                                text: 'Popular Products',
                                fsize: 12,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(() => GridView.builder(
                          itemCount: hcon.popproductlist.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.7, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return ProductTile(
                              prod: hcon.popproductlist[index],
                            );
                          })),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          color: Colors.white,
                          height: 40.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  print(hcon.recentproductlist.length);
                                },
                                child: Txt(
                                  text: 'Recently Added Products',
                                  fsize: 12,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => GridView.builder(
                            itemCount: hcon.recentproductlist.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.7, crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return ProductTile(
                                prod: hcon.recentproductlist[index],
                              );
                            }),
                      ),
                    ],
                  ),
                  Obx(() => hcon.showclear.value
                      ? hcon.searchlist.length != 0
                          ? Positioned(
                              top: 2,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: Get.height / 2,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25))),
                                child: Obx(() => ListView.builder(
                                    itemCount: hcon.searchlist.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final search = hcon.searchlist[index];
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: InkWell(
                                              onTap: () {
                                                hcon.serachprodview(
                                                    search['suggestion']);
                                                Get.to(() => ProductsView());
                                              },
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Txt(
                                                          text: search[
                                                              'suggestion'],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              height: 0.1,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      );
                                    })),
                              ))
                          : SizedBox()
                      : SizedBox())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
