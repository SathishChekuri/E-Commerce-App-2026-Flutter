
import 'package:flutter/foundation.dart';

import '../models/product.dart';

class CartData {
  static final ValueNotifier<List<Product>> items =
      ValueNotifier<List<Product>>([]);

  static void add(Product product) {
    items.value = [...items.value, product];
  }

  static void remove(Product product) {
    final updatedItems = List<Product>.from(items.value);
    updatedItems.remove(product);
    items.value = updatedItems;
  }
}
