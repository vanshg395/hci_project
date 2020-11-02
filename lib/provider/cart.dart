import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => [..._cartItems];

  int cartTotal() {
    int total = 0;
    for (var item in cartItems) {
      total += item['qty'] * int.parse(item['price']);
    }
    return total;
  }

  void addToCart(String title, String price, int qty) {
    if (_cartItems
            .where((element) => element['title'] == title)
            .toList()
            .length ==
        0) {
      final _item = {
        'title': title,
        'qty': qty,
        'price': price,
      };
      _cartItems.add(_item);
    } else {
      _cartItems.where((element) => element['title'] == title).toList()[0]
          ['qty'] += qty;
    }
    notifyListeners();
  }

  void deleteItem(String title) {
    _cartItems.removeWhere((element) => element['title'] == title);
    notifyListeners();
  }
}
