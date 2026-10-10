
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/main.dart';

void main() {
  testWidgets('Ecommerce app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const EcommerceApp());

    expect(find.text('E-Commerce App'), findsOneWidget);
  });
}
