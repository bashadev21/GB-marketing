import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/zoom_image.dart';
import 'package:gb_marketing/widgets/zoom.dart';
import 'package:get/get.dart';

import '../api_endpoints.dart';

class ZoomImage extends StatelessWidget {
  final List imgs;
  ZoomImage({Key? key, required this.imgs}) : super(key: key);
  final ZoomCon _con = Get.find();
  Future<bool> onWillPop() {
    _con.selectedPageIndex.value = 0;
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    var pageController =
        PageController(initialPage: _con.selectedPageIndex.value);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Get.theme.primaryColor,
            elevation: 0,
            leading: BackButton(
              onPressed: () {
                Get.back();

                _con.selectedPageIndex.value = 0;
              },
              color: Colors.white,
            )),
        body: Stack(
          children: [
            PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: _con.selectedPageIndex,
                itemCount: imgs.length,
                itemBuilder: (context, index) {
                  return DoubleTap(
                    child: InteractiveViewer(
                        child: CachedNetworkImage(
                      imageUrl: API().imagebase + imgs[index]['image'],
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imgs.length,
                  (index) => Obx(() {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      margin: const EdgeInsets.all(4),
                      width: _con.selectedPageIndex.value == index ? 10 : 6,
                      height: _con.selectedPageIndex.value == index ? 10 : 6,
                      decoration: BoxDecoration(
                        color: _con.selectedPageIndex.value == index
                            ? Get.theme.primaryColor
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
