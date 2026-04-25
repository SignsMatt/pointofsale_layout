import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/price_line.dart';

class TotalsCard extends StatelessWidget {
  const TotalsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            PriceLine(label: 'Subtotal', amount: 35.25),
            SizedBox(height: 6),
            PriceLine(label: 'Discounts', amount: -5.00),
            SizedBox(height: 6),
            PriceLine(label: 'Sales Tax', amount: 2.25),
            SizedBox(height: 12),
            Divider(height: 1),
            SizedBox(height: 12),
            PriceLine(label: 'Total', amount: 37.50, emphasize: true),
          ],
        ),
      ),
    );
  }
}
