import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'text.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    height: 75.sp,
                    width: 75.sp,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Icon(CupertinoIcons.delete))
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                                fontSize: 11.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Txt(
                              text: '₹50000',
                              fsize: 13,
                              color: Colors.black,
                              weight: FontWeight.w500,
                            ),
                          ],
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
