import 'package:flutter/material.dart';

class ProductGridFade extends StatelessWidget {
  const ProductGridFade({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).scaffoldBackgroundColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [scaffoldColor.withValues(alpha: 0), scaffoldColor],
        ),
      ),
    );
  }
}
