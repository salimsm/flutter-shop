import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/common/custom_button.dart';
import 'package:flutter_project_10/src/models/models.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider/cart_provider.dart';
import '../widgets/widgets.dart';

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
          const CustomAppBar(title: 'Cart'),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return ListView.builder(
                  itemBuilder: (contenxt, index) {
                    CartProduct product = cartProvider.productCartList[index];
                    return CartCard(product: product, index: index);
                  },
                  itemCount: value.productCartList.length,
                );
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Text(
                  'Total Price: ${value.totalPrice.toStringAsFixed(3)}',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold));
            },
          ),
          CustomButton(
                  onPress: () => {cartProvider.clearCartList()},
                  text: 'Checkout',
                  //width: 200,
                ),
        ],
      ),
    );
  }
}
