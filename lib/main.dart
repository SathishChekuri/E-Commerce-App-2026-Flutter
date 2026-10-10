
import 'package:flutter/material.dart';

import 'models/product.dart';
import 'theme/app_theme.dart';
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
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (
                context,
                animation,
                secondaryAnimation,
              ) {
                return ProductDetailsScreen(product: argument);
              },
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                final slideAnimation = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );

                return SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
            );
          }

          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Product details unavailable'),
              ),
            ),
          );
        }

        return null;
      },
    );
  }
}
