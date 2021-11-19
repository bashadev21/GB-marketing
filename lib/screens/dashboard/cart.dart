import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/graient_btn.dart';
import 'package:gb_marketing/widgets/text.dart';
import 'package:sizer/sizer.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0.sp),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Center(
                child: Txt(
                  text: 'Cart',
                  weight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: Placeholder(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Txt(
                                                text: 'Wooden Table ',
                                                fsize: 13,
                                                lines: 2,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                                onTap: () {},
                                                child:
                                                    Icon(CupertinoIcons.delete))
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Txt(
                                            text: 'M.R.P. ',
                                            fsize: 11,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            '₹56565',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Txt(
                                            text: '₹50000',
                                            fsize: 12,
                                            color: Colors.pink,
                                            weight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.remove_circle,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Txt(
                                              text: '1',
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.add_circle,
                                              color: Colors.redAccent,
                                            ),
                                          ],
                                        ),
                                        Txt(
                                          text: '₹50000',
                                          fsize: 13,
                                          color: Colors.black,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
            ),
            Container(
              height: kBottomNavigationBarHeight + 5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: RaisedGradientButton(
                    text: 'Proceed to Checkout',
                    gradient: LinearGradient(
                      colors: <Color>[Colors.lightBlue, Colors.blueAccent],
                    ),
                    onPressed: () {
                      print('button clicked');
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
