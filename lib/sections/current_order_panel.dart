import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/order_item.dart';
import 'package:pointofsale_layout/sections/widgets/cashless_credit_card.dart';
import 'package:pointofsale_layout/sections/widgets/order_line.dart';
import 'package:pointofsale_layout/sections/widgets/order_list_fade.dart';
import 'package:pointofsale_layout/sections/widgets/tag_button_styles.dart';
import 'package:pointofsale_layout/sections/widgets/totals_card.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class CurrentOrderPanel extends StatelessWidget {
  const CurrentOrderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Row(
              spacing: 8,
              children: [
                const Expanded(
                  child: Text(
                    'Current Order',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(
                  style: dangerTagButtonStyle,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Clear All'),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
            Expanded(
              child: Column(
                spacing: 10,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.separated(
                          padding: const EdgeInsets.only(bottom: 52),
                          itemCount: orderItems.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 15),
                          itemBuilder: (context, index) {
                            return OrderLine(item: orderItems[index]);
                          },
                        ),
                        const Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          height: 56,
                          child: IgnorePointer(child: OrderListFade()),
                        ),
                      ],
                    ),
                  ),
                  const TotalsCard(),
                  const CashlessCreditCard(),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: AppColors.filterAccent,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Pay With Cashless Credit'),
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        'Balance Due',
                        style: TextStyle(color: Colors.black54),
                      ),
                      Spacer(),
                      Text(
                        '\$5.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.inkStrong,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
