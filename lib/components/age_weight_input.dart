import 'package:flutter/material.dart';
import '../constants.dart';

class AgeWeightInput extends StatelessWidget {
  const AgeWeightInput({
    super.key,
    required this.weight,
    required this.label,
    required this.plusClick,
    required this.minusClick,
  });

  final int weight;
  final String label;
  final VoidCallback plusClick;
  final VoidCallback minusClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: textStyle,
        ),
        Text(
          weight.toString(),
          style: numericalTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: plusClick,
                style: plusMinusButtonsStyle,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: minusClick,
                style: plusMinusButtonsStyle,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
