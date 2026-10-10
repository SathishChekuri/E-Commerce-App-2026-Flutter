# E-Commerce App — Flutter

A Flutter-based e-commerce application developed as part of Flutter lab experiments. The project demonstrates Flutter UI development, responsive layouts, navigation, state management, form validation, animations, REST API integration and widget testing.

## Features

- **Product Listing:** Fetches product data from the Fake Store API.
- **Responsive UI:** Adapts product grids for mobile, tablet and desktop layouts.
- **Product Details:** Displays product images, names, prices and descriptions.
- **Shopping Cart:** Add and remove products using reactive state updates.
- **Navigation:** Bottom navigation for Home, Cart and Profile with named routes.
- **Checkout Form:** Customer details form with input validation.
- **Animations:** Fade and slide animations for product cards and product details navigation.
- **Reusable Widgets:** Shared product card and primary button components.
- **App Theme:** Centralized theme configuration.
- **Widget Tests:** Automated tests for cart behavior.

## Tech Stack

- Flutter
- Dart
- Material Design 3
- HTTP package
- Fake Store API
- Flutter Widget Testing

## Project Structure

```text
lib/
├── data/
│   ├── cart_data.dart
│   └── product_data.dart
├── models/
│   └── product.dart
├── screens/
│   ├── home_screen.dart
│   ├── product_details_screen.dart
│   ├── main_navigation_screen.dart
│   ├── cart_screen.dart
│   ├── profile_screen.dart
│   └── checkout_screen.dart
├── services/
│   └── product_service.dart
├── theme/
│   └── app_theme.dart
├── widgets/
│   ├── product_card.dart
│   ├── animated_product_card.dart
│   ├── responsive_layout.dart
│   └── app_primary_button.dart
└── main.dart

test/
├── widget_test.dart
└── cart_screen_test.dart
```

## Flutter Lab Concepts

1. Flutter and Dart project setup
2. Flutter widgets and layout using Row, Column and related widgets
3. Responsive UI using MediaQuery and LayoutBuilder
4. Navigation using Navigator and named routes
5. State management using setState and ValueNotifier
6. Reusable widgets and application themes
7. Form fields and input validation
8. Fade and slide animations
9. REST API integration and JSON parsing
10. Widget testing and debugging

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK (included with Flutter)
- Android Studio or Visual Studio Code
- Internet connection for API product data

### Install dependencies

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

### Analyze the code

```bash
flutter analyze
```

### Run tests

```bash
flutter test
```

## Product API

The application fetches sample product data from the [Fake Store API](https://fakestoreapi.com/products).

This API provides demonstration data and is not a live store inventory or payment service.

## Current Limitations

- Cart contents are stored in memory and are not persisted after restarting the app.
- Checkout validates customer details but does not create a real order.
- No real payment gateway or user authentication is implemented.
- Product data depends on API availability and internet connectivity.

## Future Improvements

- Add persistent cart storage.
- Implement user authentication.
- Connect to a custom backend and database.
- Add order history and order management.
- Integrate a payment gateway in a secure, production-ready environment.

## Testing

Run `flutter analyze` and `flutter test` before submitting changes. The cart widget tests verify empty-cart behavior, product display and item removal.

## Author

Sathish Chekuri
