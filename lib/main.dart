
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'models/product.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/checkout_screen.dart';

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
     theme: AppTheme.lightTheme,
      initialRoute: '/home',
      routes: {
      '/home': (context) => const MainNavigationScreen(),
      '/checkout': (context) => const CheckoutScreen(),
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
