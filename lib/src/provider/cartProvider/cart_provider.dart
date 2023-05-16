import 'package:flutter/material.dart';
import '../../models/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartProduct> _productCartList = [];
  double _totalPrice = 0.0;
  int _totalQuantity = 0;

  List<CartProduct> get productCartList => _productCartList;

  int get itemNumber => _totalQuantity;

  void addProductToCart(CartProduct product) {
    bool doesContain = _productCartList.contains(product.product.id);

    if (!doesContain) {
      _productCartList.add(product);
      _totalPrice += product.itemTotalPrice;
      _totalQuantity += product.quantity;
      notifyListeners();
    }

  }

  // void changeQuantity(int id){
  //   _productCartList = _productCartList.map((item){
  //     if(item.product.id ===id){
  //       return
  //     }
  //   }
  // }
}
