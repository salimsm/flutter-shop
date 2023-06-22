import 'package:flutter/material.dart';
import '../../models/models.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Product> _favProductList = [];

  List<Product> get favProductList => _favProductList;

  void addProductToCart(Product product) {
    _favProductList.add(product);
    notifyListeners();
  }

  void removeItem(CartProduct product) {
    _favProductList.remove(product);
    notifyListeners();
  }

  void clearCartList() {
    _favProductList = [];
    notifyListeners();
  }
}
