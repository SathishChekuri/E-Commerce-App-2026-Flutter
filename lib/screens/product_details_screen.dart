
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../data/cart_data.dart';
import '../widgets/app_primary_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 300,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 60,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              '₹${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            AppPrimaryButton(
              label: 'Add to Cart',
              icon: Icons.shopping_cart,
              onPressed: () {
                CartData.add(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product added to cart'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
