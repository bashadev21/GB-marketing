import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';

class DrawerTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  const DrawerTile(
      {Key? key, required this.onTap, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: ListTile(
          onTap: onTap,
          visualDensity: VisualDensity(horizontal: 0, vertical: -2.5),
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Txt(
            text: title,
            fsize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
