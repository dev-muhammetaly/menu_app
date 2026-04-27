import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> selectedItems = [];

  double get totalAmount {
    double total = 0;
    for (var item in selectedItems) {
      total += (item['baha'] as double) * (item['quantity'] as int? ?? 1);
    }
    return total;
  }

  void addItem(Map<String, dynamic> product) {
    final existingItemIndex = selectedItems.indexWhere(
      (item) => item['ady'] == product['ady'],
    );

    if (existingItemIndex >= 0) {
      // Item already exists, update quantity
      selectedItems[existingItemIndex]['quantity'] =
          (selectedItems[existingItemIndex]['quantity'] as int? ?? 0) + 1;
    } else {
      // Add new item with quantity 1
      selectedItems.add({
        'ady': product['ady'],
        'baha': product['baha'],
        'surat': product['surat'],
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = selectedItems.indexWhere((item) => item['ady'] == productId);
    if (index >= 0) {
      selectedItems[index]['quantity'] = newQuantity;
      notifyListeners();
    }
  }

  void incrementQuantity(String productId) {
    final index = selectedItems.indexWhere((item) => item['ady'] == productId);
    if (index >= 0) {
      selectedItems[index]['quantity'] =
          (selectedItems[index]['quantity'] as int? ?? 0) + 1;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    final index = selectedItems.indexWhere((item) => item['ady'] == productId);
    if (index >= 0) {
      final currentQuantity = selectedItems[index]['quantity'] as int? ?? 0;
      if (currentQuantity > 1) {
        selectedItems[index]['quantity'] = currentQuantity - 1;
      } else {
        selectedItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    selectedItems.removeWhere((item) => item['ady'] == productId);
    notifyListeners();
  }

  void clearCart() {
    selectedItems.clear();
    notifyListeners();
  }
}
