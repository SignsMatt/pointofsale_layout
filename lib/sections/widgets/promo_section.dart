import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);
    final promoButtonStyle = FilledButton.styleFrom(
      backgroundColor: colors.promoSurface,
      foregroundColor: colors.inkMuted,
      minimumSize: const Size.fromHeight(56),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
    final selectedPromoButtonStyle = promoButtonStyle.copyWith(
      backgroundColor: WidgetStatePropertyAll(colors.cardSurface),
      foregroundColor: WidgetStatePropertyAll(colors.inkStrong),
      side: const WidgetStatePropertyAll(BorderSide(color: AppColors.danger)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          spacing: 6,
          children: [
            Text(
              'SELECT AVAILABLE PROMO TO APPLY',
              style: TextStyle(
                fontSize: 10,
                color: colors.sectionLabel,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.25,
              ),
            ),
            Text(
              '(LIMIT 1 PER ORDER)',
              style: TextStyle(
                fontSize: 9,
                color: colors.sectionMuted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: FilledButton(
                style: selectedPromoButtonStyle,
                onPressed: () {},
                child: const Text('\$5 Off Any Item'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: promoButtonStyle,
                onPressed: () {},
                child: const Text('Free Beverage'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: promoButtonStyle,
                onPressed: () {},
                child: const Text('20% Off Entire Order'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
