
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecommerce_app/data/cart_data.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';

void main() {
  setUp(() {
    CartData.items.value = [];
  });

  testWidgets('shows empty cart message when cart is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CartScreen(),
      ),
    );

    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Proceed to Checkout'), findsNothing);
  });

  testWidgets('displays a product added to the cart',
      (WidgetTester tester) async {
    final product = Product(
      id: 1,
      name: 'Test Headphones',
      price: 999.0,
      image: 'https://example.com/headphones.jpg',
      description: 'Test product description',
    );

    CartData.add(product);

    await tester.pumpWidget(
      const MaterialApp(
        home: CartScreen(),
      ),
    );

    expect(find.text('Test Headphones'), findsOneWidget);
    expect(find.text('₹999'), findsOneWidget);
    expect(find.text('Proceed to Checkout'), findsOneWidget);
  });

  testWidgets('removing the last product shows an empty cart',
      (WidgetTester tester) async {
    final product = Product(
      id: 2,
      name: 'Test Shoes',
      price: 1499.0,
      image: 'https://example.com/shoes.jpg',
      description: 'Test shoes description',
    );

    CartData.add(product);

    await tester.pumpWidget(
      const MaterialApp(
        home: CartScreen(),
      ),
    );

    expect(find.text('Test Shoes'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Proceed to Checkout'), findsNothing);
  });
}
