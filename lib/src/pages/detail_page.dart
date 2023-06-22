import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/provider/favouriteProvider/favourite_provider.dart';
import 'package:flutter_project_10/src/widgets/cart_page_quantity_counter.dart';
import 'package:provider/provider.dart';
import '../common/common.dart';
import '../const/const.dart';
import '../models/models.dart';
import '../provider/cartProvider/cart_provider.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  final Product product;
  late CartProvider _cartProvider;
  int _quantity = 1;

  DetailPage(this.product, {Key? key}) : super(key: key);
  void addToCart(BuildContext context) {
    CartProduct newCartProduct = CartProduct(
      id: product.id,
      title: product.title,
      price: product.price,
      quantity: _quantity,
      image: product.image,
    );
    _cartProvider.addProductToCart(newCartProduct);
    navigateBackTo(context);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingSectionCard(
                      rate: product.rating.rate,
                      count: product.rating.count,
                    ),
                    FavIconButton(),
                  ],
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
                Consumer<CartProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    int index = value.productCartList
                        .indexWhere((item) => item.id == product.id);

                    if (index < 0) {
                      return Column(
                        children: [
                          QuantityCounter(getQuantity: (quant, description) {
                            _quantity = quant;
                          }),
                          CustomButton(
                            onPress: () => addToCart(context),
                            icon: Icons.shopping_cart,
                            text: AppString.addToCart,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ],
                      );
                    }
                    return CartPageQuantityCounter(
                        getQuantity: (quantity, description, index) {
                          _cartProvider.changeQuantity(
                              product.id, description, index);
                        },
                        quantity: value.productCartList[index].quantity,
                        index: index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavIconButton extends StatefulWidget {
  FavIconButton({super.key});

  @override
  State<FavIconButton> createState() => _FavIconButtonState();
}

class _FavIconButtonState extends State<FavIconButton> {
  bool isFav = false;
  
  void onTap(FavouriteProvider favProvider) {
    List<Product> list = favProvider.favProductList;
    // TODO
    //todo
    isFav=!isFav;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    FavouriteProvider favProvider = Provider.of<FavouriteProvider>(context,listen: false);
    return GestureDetector(
      onTap:()=> onTap(favProvider),
      child: Card(
          color: AppColor.kBackground,
          margin: const EdgeInsets.all(8),
          child: isFav
              ? Icon(
                  Icons.favorite,
                  size: 30,
                  color: AppColor.kPrimary,
                )
              : Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: AppColor.kPrimary,
                )),
    );
  }
}
