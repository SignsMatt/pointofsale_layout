import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class OrderListFade extends StatelessWidget {
  const OrderListFade({super.key});

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
