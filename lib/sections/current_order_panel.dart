import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/order_item.dart';
import 'package:pointofsale_layout/sections/widgets/cashless_credit_card.dart';
import 'package:pointofsale_layout/sections/widgets/order_line.dart';
import 'package:pointofsale_layout/sections/widgets/order_list_fade.dart';
import 'package:pointofsale_layout/sections/widgets/tag_button_styles.dart';
import 'package:pointofsale_layout/sections/widgets/totals_card.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class CurrentOrderPanel extends StatelessWidget {
  const CurrentOrderPanel({
    super.key,
    required this.orderItems,
    required this.onIncrementItem,
    required this.onDecrementItem,
    required this.onClearOrder,
    required this.isDarkMode,
    required this.onToggleThemeMode,
  });

  final List<OrderItem> orderItems;
  final ValueChanged<OrderItem> onIncrementItem;
  final ValueChanged<OrderItem> onDecrementItem;
  final VoidCallback onClearOrder;
  final bool isDarkMode;
  final VoidCallback onToggleThemeMode;

  static const _cashlessCredit = 32.50;

  double get subtotal {
    return orderItems.fold(0, (total, item) => total + item.totalPrice);
  }

  double get discounts {
    if (subtotal == 0) return 0;
    return subtotal < 5 ? -subtotal : -5.00;
  }

  double get salesTax {
    return (subtotal + discounts) * 0.064;
  }

  double get total {
    return subtotal + discounts + salesTax;
  }

  double get balanceDue {
    final balance = total - _cashlessCredit;
    return balance < 0 ? 0 : balance;
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.panelSurface,
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(
                  style: dangerTagButtonStyle(context),
                  onPressed: orderItems.isEmpty ? null : onClearOrder,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Clear All'),
                  ),
                ),
                IconButton(
                  onPressed: onToggleThemeMode,
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  tooltip: isDarkMode ? 'Use light mode' : 'Use dark mode',
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
                        if (orderItems.isEmpty)
                          Center(
                            child: Text(
                              'No items yet',
                              style: TextStyle(color: colors.inkMuted),
                            ),
                          )
                        else
                          ListView.separated(
                            padding: const EdgeInsets.only(bottom: 52),
                            itemCount: orderItems.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 15),
                            itemBuilder: (context, index) {
                              final item = orderItems[index];

                              return OrderLine(
                                item: item,
                                onIncrement: () => onIncrementItem(item),
                                onDecrement: () => onDecrementItem(item),
                              );
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
                  TotalsCard(
                    subtotal: subtotal,
                    discounts: discounts,
                    salesTax: salesTax,
                    total: total,
                  ),
                  const CashlessCreditCard(availableAmount: _cashlessCredit),
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
                  Row(
                    children: [
                      Text(
                        'Balance Due',
                        style: TextStyle(color: colors.inkMuted),
                      ),
                      const Spacer(),
                      Text(
                        '\$${balanceDue.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: colors.inkStrong,
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
