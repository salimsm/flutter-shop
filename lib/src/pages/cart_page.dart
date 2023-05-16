import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/models/models.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider/cart_provider.dart';
import '../widgets/quantity_counter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // late  final CartProvider _cartProvider;
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context,listen: false);
    return Scaffold(
      body: Center(child: Consumer<CartProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(itemBuilder: (contenxt, index) {
            CartProduct _product = _cartProvider.productCartList[index];
            return CartCard(product: _product);
          },itemCount:value.productCartList.length,);
        },
      )),
    );
  }
}

class CartCard extends StatelessWidget {
  final CartProduct product;
  const CartCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context,listen: false);
    return Card(
      child: Row(
        children: [
          Image.network(product.product.image,
              height: 100, width: 100, fit: BoxFit.contain),
          Column(
            children: [
              Text(product.product.title),
              QuantityCounter(getQuantity:(val){
                // _cartProvider.
              },quantity: product.quantity),
              Text(product.product.price.toString()),
            ],
          )
        ],
      ),
    );
  }
}
