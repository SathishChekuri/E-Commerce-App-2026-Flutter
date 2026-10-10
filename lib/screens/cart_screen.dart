
import 'package:flutter/material.dart';

import '../data/cart_data.dart';
import '../widgets/app_primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: ValueListenableBuilder(
        valueListenable: CartData.items,
        builder: (context, items, child) {
          if (items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];

              return Card(
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.shopping_bag_outlined,
                        size: 40,
                      );
                    },
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    '₹${product.price.toStringAsFixed(0)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      CartData.remove(product);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: CartData.items,
        builder: (context, items, child) {
          if (items.isEmpty) {
            return const SizedBox.shrink();
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AppPrimaryButton(
                label: 'Proceed to Checkout',
                icon: Icons.shopping_bag_outlined,
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
