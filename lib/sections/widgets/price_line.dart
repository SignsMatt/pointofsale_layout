import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class PriceLine extends StatelessWidget {
  const PriceLine({
    super.key,
    required this.label,
    required this.amount,
    this.emphasize = false,
  });

  final String label;
  final double amount;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: emphasize ? AppColors.inkStrong : AppColors.inkMuted,
            fontSize: emphasize ? 22 : 16,
            fontWeight: emphasize ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: emphasize ? 22 : 16,
            fontWeight: FontWeight.w700,
            color: AppColors.inkStrong,
          ),
        ),
      ],
    );
  }
}
