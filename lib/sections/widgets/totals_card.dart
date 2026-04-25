import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/price_line.dart';

class TotalsCard extends StatelessWidget {
  const TotalsCard({
    super.key,
    required this.subtotal,
    required this.discounts,
    required this.salesTax,
    required this.total,
  });

  final double subtotal;
  final double discounts;
  final double salesTax;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            PriceLine(label: 'Subtotal', amount: subtotal),
            const SizedBox(height: 6),
            PriceLine(label: 'Discounts', amount: discounts),
            const SizedBox(height: 6),
            PriceLine(label: 'Sales Tax', amount: salesTax),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            PriceLine(label: 'Total', amount: total, emphasize: true),
          ],
        ),
      ),
    );
  }
}
