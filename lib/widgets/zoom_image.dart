import 'package:flutter/material.dart';
import 'package:gb_marketing/services/controllers/zoom_image.dart';
import 'package:get/get.dart';

class ZoomImage extends StatelessWidget {
  final List imgs;
  const ZoomImage({Key? key, required this.imgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ZoomCon _con = Get.find();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0,
          leading: BackButton(
            color: Colors.white,
          )),
      body: Stack(
        children: [
          PageView.builder(
              controller: _con.pageController,
              onPageChanged: _con.selectedPageIndex,
              itemCount: imgs.length,
              itemBuilder: (context, index) {
                return InteractiveViewer(
                    child: Image.network(imgs[index]['img']));
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
    );
  }
}
