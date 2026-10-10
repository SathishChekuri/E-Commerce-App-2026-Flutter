
import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_card.dart';

class AnimatedProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;
  final int index;

  const AnimatedProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.index,
  });

  @override
  State<AnimatedProductCard> createState() =>
      _AnimatedProductCardState();
}

class _AnimatedProductCardState extends State<AnimatedProductCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curvedAnimation);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(curvedAnimation);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ProductCard(
          product: widget.product,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
