import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/provider/cartProvider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'custom_icon.dart';

class QuantityCounter extends StatefulWidget {
  final Function(int,String) getQuantity;
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
      widget.getQuantity(counter,'increase');
      setState(() {});
    }
  }

  void decrement() {
    if (counter > 1) {
      counter--;
      widget.getQuantity(counter,'decrease');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    CartProvider _cartProvider = Provider.of<CartProvider>(context,listen:false);
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
