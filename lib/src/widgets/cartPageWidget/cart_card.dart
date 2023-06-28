
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../provider/cartProvider/cart_provider.dart';
import '../cart_page_quantity_counter.dart';
import '../widgets.dart';

class CartCard extends StatelessWidget {
  final CartProduct product;
  final int index;
  const CartCard({required this.product, required this.index, super.key});


  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    
    void removeItemFromCart(CartProduct prod){
      cartProvider.removeItem(prod);
    }
    print('card');
    return Card(
      child: Row(
        children: [
          Image.network(product.image,
              height: 100, width: 100, fit: BoxFit.contain),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 17),
                  ),
                  CartPageQuantityCounter(
                      getQuantity: (value, description, index) {
                        cartProvider.changeQuantity(
                            product.id, description, index);
                      },
                      quantity: product.quantity,
                      index: index),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price: ${product.price.toString()}',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      CustomIcon(
                          name: Icons.delete,
                          size: 20,
                          iconColor: Colors.red.shade300,
                          onTap: ()=>removeItemFromCart(product)),
                    ],
                  ),
                  const Divider(),
                  Consumer<CartProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      String total =(value.productCartList[index].price * value.productCartList[index].quantity).toStringAsFixed(3); 
                      return Text(
                        'Total: $total',
                        //'Total: ${value.productCartList[index].price * value.productCartList[index].quantity}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
