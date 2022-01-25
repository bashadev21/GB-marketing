import 'package:flutter/material.dart';
import 'package:gb_marketing/screens/products.dart';
import 'package:gb_marketing/services/controllers/category.dart';
import 'package:gb_marketing/services/controllers/home.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:get/get.dart';

class EndDrawerWidget extends StatefulWidget {
  EndDrawerWidget({Key? key}) : super(key: key);

  @override
  State<EndDrawerWidget> createState() => _EndDrawerWidgetState();
}

class _EndDrawerWidgetState extends State<EndDrawerWidget> {
  int selected = -1;
  final CatCon ccon = Get.find();
  final HomeCon hcon = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Txt(
                text: 'Choose category',
                defalutsize: true,
              ),
            ],
          ),
          Obx(() => ListView.builder(
              key: Key('builder ${selected.toString()}'),
              itemCount: ccon.allcategotylist.length,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final cat = ccon.allcategotylist[index];
                return ExpansionTile(
                  onExpansionChanged: ((newState) {
                    ccon.getsubcat(cat['category_id']);

                    if (newState)
                      setState(() {
                        Duration(seconds: 1);
                        selected = index;
                      });
                    else
                      setState(() {
                        selected = -1;
                      });
                  }),
                  key: Key(index.toString()),
                  initiallyExpanded: index == selected,
                  title: Text(cat['category_name']),
                  children: <Widget>[
                    Obx(() => ListView.builder(
                        itemCount: ccon.subcategotylist.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          final sub = ccon.subcategotylist[i];
                          return ListTile(
                              onTap: () {
                                hcon.getpopcatprod(sub['sub_cate_id'],
                                    paramn: 'sub_categoryid');
                                Get.to(() => ProductsView());
                              },
                              title: Text(sub['sub_cate_name']));
                        }))
                  ],
                );
              }))
        ],
      ),
    );
    ;
  }
}
