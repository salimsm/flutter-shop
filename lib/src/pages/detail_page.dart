import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/common.dart';
import '../const/const.dart';
import '../models/models.dart';
import '../provider/cartProvider/cart_provider.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  late CartProvider _cartProvider;
  int _quantity = 1;

  DetailPage(this.product, {Key? key}) : super(key: key);
  void addToCart() {
    CartProduct newCartProduct = CartProduct(
        product: product,
        quantity: _quantity,
        itemTotalPrice: _quantity * product.price);
    _cartProvider.addProductToCart(newCartProduct);
  }

  @override
  Widget build(BuildContext context) {
    _cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icons.chevron_left,
        leadingIconOnPress: () {
          navigateBackTo(context);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: AppColor.kBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  color: AppColor.kWhite,
                  child: Image.network(
                    product.image,
                    height: 220,
                    width: double.maxFinite,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                RatingSectionCard(
                  rate: product.rating.rate,
                  count: product.rating.count,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle: AppString.category,
                  descriptionBody: product.category,
                ),
                const SizedBox(
                  height: 10,
                ),
                DescriptionSection(
                  descriptionTitle: AppString.description,
                  descriptionBody: product.description,
                ),
                QuantityCounter(getQuantity: (quant) {
                  _quantity = quant;
                }),
                CustomButton(
                  onPress: addToCart,
                  icon: Icons.shopping_cart,
                  text: AppString.addToCart,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
