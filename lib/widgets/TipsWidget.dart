import 'package:flutter/material.dart';

class TipsWidget extends StatelessWidget {
  const TipsWidget({
    super.key,
    required int numberOfPeople,
    required this.decrease,
    required this.increase,
  }) : _numberOfPeople = numberOfPeople;

  final int _numberOfPeople;
  final VoidCallback decrease;
  final VoidCallback increase;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Text("Splint", style: (TextStyle(fontSize: 18, color: Colors.blue))),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 1,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Colors.blue),
              onPressed: decrease,
            ),
            Text(
              '$_numberOfPeople',
              style: const TextStyle(fontSize: 24, color: Colors.blue),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.blue),
              onPressed: increase,
            ),
          ],
        ),
      ],
    );
  }
}
