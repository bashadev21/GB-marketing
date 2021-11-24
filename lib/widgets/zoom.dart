import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class DoubleTap extends StatefulWidget {
  final Widget child;
  DoubleTap({Key? key, required this.child}) : super(key: key);

  @override
  State<DoubleTap> createState() => _DoubleTapState();
}

class _DoubleTapState extends State<DoubleTap>
    with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? con;

  @override
  void initState() {
    con = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 450));
    animation = Tween(begin: 1.0, end: 2.0)
        .animate(CurvedAnimation(parent: con!, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        if (con!.isCompleted) {
          con!.reverse();
        } else {
          con!.forward();
        }
      },
      child: GestureDetector(
        onTap: () {
          con!.reverse();
        },
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.diagonal3(
              Vector3(animation!.value, animation!.value, animation!.value)),
          child: widget.child,
        ),
      ),
    );
  }
}
