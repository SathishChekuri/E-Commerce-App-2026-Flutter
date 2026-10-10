
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService {
  static const String _baseUrl =
      'https://fakestoreapi.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) {
          return Product(
          id: (json['id'] as num).toInt(),
          name: json['title'] as String,
          price: (json['price'] as num).toDouble(),
          image: json['image'] as String,
          description: json['description'] as String,
        );
      }).toList();
    }

    throw Exception(
      'Failed to load products: ${response.statusCode}',
    );
  }
}
