import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/common/custom_button.dart';
import 'package:flutter_project_10/src/models/models.dart';
import 'package:flutter_project_10/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider/cart_provider.dart';
import '../widgets/cart_page_quantity_counter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Cart'),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return ListView.builder(
                  itemBuilder: (contenxt, index) {
                    CartProduct product = cartProvider.productCartList[index];
                    return CartCard(product: product,index:index);
                  },
                  itemCount: value.productCartList.length,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<CartProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Text('Total Price: ${value.totalPrice.round()}',style:const TextStyle(fontSize: 17,fontWeight:FontWeight.bold));
                },
              ),
              CustomButton(
                onPress: () => {cartProvider.clearCartList()},
                text: 'Checkout',
                width: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  final CartProduct product;
  final int index;
  const CartCard({required this.product,required this.index ,super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider =
        Provider.of<CartProvider>(context, listen: false);
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
                    overflow:TextOverflow.ellipsis ,
                    style: const TextStyle( fontSize: 17),
                  ),
                  CartPageQuantityCounter(
                      getQuantity: (value, description,index) {
                        _cartProvider.changeQuantity(product.id, description,index);
                      },
                      quantity: product.quantity,index:index),
                  Text('Price: ${product.price.toString()}',style:TextStyle(fontSize: 17,fontWeight:FontWeight.bold)),
                  const Divider(),
                  Consumer<CartProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Text('Total: ${value.productCartList[index].price*value.productCartList[index].quantity}',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),);
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
