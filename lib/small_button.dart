import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {Key? key,
      required this.icon,
      required this.backgroundColor,
      required this.onTap})
      : super(key: key);

  final Icon icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: ColoredBox(
        color: backgroundColor,
        child: Center(
          child: IconButton(onPressed: onTap, icon: icon),
        ),
      ),
    );
  }
}
