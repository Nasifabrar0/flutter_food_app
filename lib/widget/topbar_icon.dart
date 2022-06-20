import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class topBarIcon extends StatelessWidget {
  const topBarIcon(
      {Key? key,
      required this.icon,
      required this.onClick,
      this.color = Colors.white,
      this.iconColor = Colors.black})
      : super(key: key);

  final icon, onClick, color, iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(24)),
        child: Icon(
          icon,
          size: 20,
          color: iconColor,
        ),
      ),
    );
  }
}
