import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 780;

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: const [_WristbandInfoSection(), _PromoSection()],
          );
        }

        return Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 16,
              children: [
                Expanded(flex: 4, child: _WristbandInfoSection()),
                Container(
                  color: AppColors.sectionMuted,
                  height: 55,
                  width: 0.5,
                ),
                Expanded(flex: 6, child: _PromoSection()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WristbandInfoSection extends StatelessWidget {
  const _WristbandInfoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text(
          'WRISTBAND INFORMATION',
          style: TextStyle(
            fontSize: 10,
            color: AppColors.sectionLabel,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.25,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  // border: Border.all(color: AppColors.subtleBorder),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 19,
                        backgroundColor: AppColors.avatarSurface,
                        child: Text(
                          'ER',
                          style: TextStyle(
                            color: AppColors.avatarText,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 3,
                          children: [
                            Text(
                              'Eleanor Russell',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.vipTag,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                child: Text(
                                  'VIP TICKET HOLDER',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 56,
              width: 95,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.danger,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {},
                child: const Text('Unlink'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PromoSection extends StatelessWidget {
  const _PromoSection();

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
          children: const [
            Expanded(
              child: _PromoButton(label: '\$5 Off Any Item', selected: true),
            ),
            Expanded(child: _PromoButton(label: 'Free Beverage')),
            Expanded(child: _PromoButton(label: '20% Off Entire Order')),
          ],
        ),
      ],
    );
  }
}

class _PromoButton extends StatelessWidget {
  const _PromoButton({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: selected ? AppColors.white : AppColors.promoSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? AppColors.danger : Colors.transparent,
        ),
      ),
      child: SizedBox(
        height: 56,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: selected ? AppColors.inkStrong : AppColors.inkMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
