import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';

class RaisedGradientButton extends StatelessWidget {
  final Gradient gradient;
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.gradient,
    required this.text,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: gradient,
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
              child: Txt(
                text: text,
                color: Colors.white,
                defalutsize: true,
                weight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
