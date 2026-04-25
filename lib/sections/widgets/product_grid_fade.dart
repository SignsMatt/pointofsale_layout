import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class ProductGridFade extends StatelessWidget {
  const ProductGridFade({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white.withValues(alpha: 0), AppColors.white],
        ),
      ),
    );
  }
}
