import 'package:flutter/material.dart';
import '../../models/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartProduct> _productCartList = [];
  double _totalPrice = 0.0;
  int _totalQuantity = 0;

  List<CartProduct> get productCartList => _productCartList;

  int get totalQuantity => _totalQuantity;
  double get totalPrice => _totalPrice;

  void addProductToCart(CartProduct product, [int? id]) {
    _productCartList.add(product);

    _totalPrice += (product.price * product.quantity);
    _totalQuantity += product.quantity;
    notifyListeners();
  }

  void changeQuantity(int id, String description, int index) {
    // _productCartList.indexWhere((item) => item.product.id == id);
    //   CartProduct selectedProduct = _productCartList[productIndex];

    if (description == 'increase') {
      _totalQuantity += 1;
      _totalPrice += _productCartList[index].price;
      _productCartList[index].quantity++;
    } else {
      _totalQuantity -= 1;
      _totalPrice -= _productCartList[index].price;

      _productCartList[index].quantity--;
    }
    notifyListeners();
  }


  void removeItem(CartProduct product){
    _totalQuantity-= product.quantity;
    _totalPrice-= (product.price*product.quantity);
    productCartList.remove(product);
    notifyListeners();
  }
  void clearCartList() {
    _productCartList = [];
    _totalPrice = 0.0;
    _totalQuantity = 0;
    notifyListeners();
  }
}

