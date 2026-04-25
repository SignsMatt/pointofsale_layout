import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class OrderListFade extends StatelessWidget {
  const OrderListFade({super.key});

  @override
  Widget build(BuildContext context) {
    final panelSurface = AppThemeColors.of(context).panelSurface;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [panelSurface.withValues(alpha: 0), panelSurface],
        ),
      ),
    );
  }
}
