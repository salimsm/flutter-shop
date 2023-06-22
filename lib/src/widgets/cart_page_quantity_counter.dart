import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/provider/cartProvider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'custom_icon.dart';

class CartPageQuantityCounter extends StatefulWidget {
  final void Function(int,String,int) getQuantity;
  final int quantity;
  final int index;
  const CartPageQuantityCounter({required this.getQuantity,required this.quantity,required this.index, super.key});

  @override
  State<CartPageQuantityCounter> createState() => _CartPageQuantityCounter();
}

class _CartPageQuantityCounter extends State<CartPageQuantityCounter> {

  void increment() {
    if (widget.quantity < 5) {
      widget.getQuantity(widget.quantity,'increase',widget.index);
    }
    print('incremtn form cart page');
  }

  void decrement() {
    if (widget.quantity > 1) {
      widget.getQuantity(widget.quantity,'decrease',widget.index);
    }
    print('decrement form cart page');

  }

  @override
  Widget build(BuildContext context) {
    // CartProvider _cartProvider = Provider.of<CartProvider>(context,listen:false);
    print('_QuantityCounterState');
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomIcon(
        name: Icons.arrow_left,
        onTap: decrement,
      ),
      Consumer<CartProvider>(
        builder: (BuildContext context, value, Widget? child){
        return Text(' ${widget.quantity} ',
            style: const TextStyle(
              fontSize: 17,
            ),);
          },
      ),
      CustomIcon(
        name: Icons.arrow_right,
        onTap: increment,
      )
    ]);
  }
}
