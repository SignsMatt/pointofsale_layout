import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/order_item.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

final _dangerIconButtonStyle = IconButton.styleFrom(
  backgroundColor: AppColors.dangerSurface,
  foregroundColor: AppColors.danger,
);

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
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.neutralSurface,
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
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          onPressed: onDecrement,
          style: item.quantity == 1 ? _dangerIconButtonStyle : null,
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
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
