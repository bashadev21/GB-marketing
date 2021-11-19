import 'package:flutter/material.dart';
import 'package:gb_marketing/widgets/text.dart';

class ProfileTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final Color color;
  const ProfileTile(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.icon,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: 0),
              leading: Icon(
                icon,
                color: color,
              ),
              title: Txt(
                text: title,
                fsize: 14,
                weight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
