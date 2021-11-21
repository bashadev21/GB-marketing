import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';

class RaisedGradientButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final bool addicon;
  final bool ispink;
  final VoidCallback onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.height = 50.0,
    this.ispink = false,
    this.addicon = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: <Color>[
              ispink ? Colors.pink : Colors.lightBlue,
              ispink ? Colors.pink : Colors.blueAccent
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (addicon)
                    Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                  if (addicon)
                    SizedBox(
                      width: 8,
                    ),
                  Txt(
                    text: text,
                    color: Colors.white,
                    defalutsize: true,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
