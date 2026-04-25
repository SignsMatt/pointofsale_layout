import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/tag_button_styles.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class CashlessCreditCard extends StatelessWidget {
  const CashlessCreditCard({super.key, required this.availableAmount});

  final double availableAmount;

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    'CASHLESS CREDIT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: colors.inkMuted,
                    ),
                  ),
                  Text(
                    '\$${availableAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: AppColors.filterAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Available',
                    style: TextStyle(color: colors.sectionMuted, fontSize: 11),
                  ),
                ],
              ),
            ),
            TextButton(
              style: tagButtonStyle(context),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
