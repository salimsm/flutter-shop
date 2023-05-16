import '../../models.dart';

class CartProduct {
  CartProduct({
    required this.product,
    required this.quantity,
    required this.itemTotalPrice,
  });

  final Product product;
  final int quantity;
  final double itemTotalPrice;
}
