import '../../models.dart';

class CartProduct {
  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    // required this.product,
    required this.quantity,
    // required this.itemTotalPrice,
  });
final int id;
  final String title;
  final double price;
  final String image;
  //final Product product;
  int quantity;
  // final double itemTotalPrice;
}
