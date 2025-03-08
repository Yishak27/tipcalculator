import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required this.persentage,
    required this.valueChange,
  });

  final double persentage;
  final ValueChanged<double> valueChange;
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: 0.5,
      label: '${(persentage * 100).round()}',
      value: persentage,
      divisions: 5,
      thumbColor: Colors.blue,
      activeColor: Colors.lightBlue,
      onChanged: valueChange,
      // onChanged: (double newValue) {
      //   // setState(() {
      //   //   persentage = newValue;
      //   // });
      //   // _calculateTotalTip();
      // },
    );
  }
}
