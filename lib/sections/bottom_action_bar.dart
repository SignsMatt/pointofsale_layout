import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/promo_section.dart';
import 'package:pointofsale_layout/sections/widgets/wristband_info_section.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 780;

        if (isCompact) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [WristbandInfoSection(), PromoSection()],
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
                const Expanded(flex: 4, child: WristbandInfoSection()),
                Container(color: colors.sectionMuted, height: 55, width: 0.5),
                const Expanded(flex: 6, child: PromoSection()),
              ],
            ),
          ),
        );
      },
    );
  }
}
