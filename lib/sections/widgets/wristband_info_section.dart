import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class WristbandInfoSection extends StatelessWidget {
  const WristbandInfoSection({super.key});

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
