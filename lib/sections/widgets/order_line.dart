import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/order_item.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class OrderLine extends StatelessWidget {
  const OrderLine({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  final OrderItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);
    final dangerIconButtonStyle = IconButton.styleFrom(
      backgroundColor: colors.dangerSurface,
      foregroundColor: AppColors.danger,
    );

    return Row(
      spacing: 8,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors.mutedSurface,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            item.product.thumbnail,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        Expanded(
          child: Text(
            item.product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colors.inkStrong,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          onPressed: onDecrement,
          style: item.quantity == 1 ? dangerIconButtonStyle : null,
          icon: Icon(item.quantity == 1 ? Icons.delete_outline : Icons.remove),
        ),
        Text(
          item.quantity.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        IconButton(onPressed: onIncrement, icon: const Icon(Icons.add)),
        SizedBox(
          width: 52,
          child: Text(
            '\$${item.totalPrice.toStringAsFixed(2)}',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: colors.inkStrong,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
