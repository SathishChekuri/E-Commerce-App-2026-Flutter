
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/animated_product_card.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onCartChanged;

  const HomeScreen({
    super.key,
    this.onCartChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();

  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _productService.fetchProducts();
  }

  void _retryLoading() {
    setState(() {
      _productsFuture = _productService.fetchProducts();
    });
  }

  Widget _productGrid(List<Product> products, int columns) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
       return AnimatedProductCard(
              product: products[index],
              index: index,
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  '/product-details',
                  arguments: products[index],
                );

                widget.onCartChanged?.call();
              },
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        actions: [
          IconButton(
            onPressed: _retryLoading,
            tooltip: 'Refresh products',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to My Store',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi_off,
                            size: 48,
                          ),
                          const SizedBox(height: 12),
                          const Text('Unable to load products.'),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: _retryLoading,
                            child: const Text('Try Again'),
                          ),
                        ],
                      ),
                    );
                  }

                  final products = snapshot.data ?? [];

                  if (products.isEmpty) {
                    return const Center(
                      child: Text('No products available.'),
                    );
                  }

                  return ResponsiveLayout(
                    mobile: _productGrid(products, 1),
                    tablet: _productGrid(products, 2),
                    desktop: _productGrid(products, 4),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
