import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

final _promoButtonStyle = FilledButton.styleFrom(
  backgroundColor: AppColors.promoSurface,
  foregroundColor: AppColors.inkMuted,
  minimumSize: const Size.fromHeight(56),
  padding: const EdgeInsets.symmetric(horizontal: 8),
  textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);

final _selectedPromoButtonStyle = _promoButtonStyle.copyWith(
  backgroundColor: const WidgetStatePropertyAll(AppColors.white),
  foregroundColor: const WidgetStatePropertyAll(AppColors.inkStrong),
  side: const WidgetStatePropertyAll(BorderSide(color: AppColors.danger)),
);

class PromoSection extends StatelessWidget {
  const PromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Row(
          spacing: 6,
          children: [
            Text(
              'SELECT AVAILABLE PROMO TO APPLY',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.sectionLabel,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.25,
              ),
            ),
            Text(
              '(LIMIT 1 PER ORDER)',
              style: TextStyle(
                fontSize: 9,
                color: AppColors.sectionMuted,
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
                style: _selectedPromoButtonStyle,
                onPressed: () {},
                child: const Text('\$5 Off Any Item'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: _promoButtonStyle,
                onPressed: () {},
                child: const Text('Free Beverage'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: _promoButtonStyle,
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
