import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/tag_button_styles.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class CashlessCreditCard extends StatelessWidget {
  const CashlessCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    'CASHLESS CREDIT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.inkMuted,
                    ),
                  ),
                  Text(
                    '\$32.50',
                    style: TextStyle(
                      color: AppColors.filterAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Available',
                    style: TextStyle(color: Colors.black45, fontSize: 11),
                  ),
                ],
              ),
            ),
            TextButton(
              style: tagButtonStyle,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
