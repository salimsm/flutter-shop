import 'package:flutter/material.dart';

import 'custom_icon.dart';

class QuantityCounter extends StatefulWidget {
  final Function(int) getQuantity;
  final int? quantity;
  const QuantityCounter({required this.getQuantity,this.quantity, super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int counter = 1;

  void increment() {
    if (counter < 5) {
      counter++;
      widget.getQuantity(counter);
      setState(() {});
    }
  }

  void decrement() {
    if (counter > 1) {
      counter--;
      widget.getQuantity(counter);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print('_QuantityCounterState');
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomIcon(
        name: Icons.arrow_left,
        onTap: decrement,
      ),
      Text(' ${counter.toString()} ',
          style: const TextStyle(
            fontSize: 17,
          )),
      CustomIcon(
        name: Icons.arrow_right,
        onTap: increment,
      )
    ]);
  }
}
