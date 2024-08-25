import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String iconText;

  const IconContent({
    required this.icon,
    required this.iconText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconsSize,
        ),
        Text(
          iconText,
          style: textStyle,
        ),
      ],
    );
  }
}
