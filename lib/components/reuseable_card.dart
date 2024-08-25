import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget? child;
  final Color color;
  final Function? onTap;
  const ReusableCard({super.key, this.child, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null
          ? () {
              onTap!();
            }
          : () {},
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}
