
import 'package:flutter/material.dart';

import 'models/product.dart';
import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product-details') {
          final argument = settings.arguments;

          if (argument is Product) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) =>
                  ProductDetailsScreen(product: argument),
            );
          }
        }

        return null;
      },
    );
  }
}
