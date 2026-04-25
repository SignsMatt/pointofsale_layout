import 'package:flutter/material.dart';
import 'package:pointofsale_layout/sections/widgets/circle_icon_button.dart';
import 'package:pointofsale_layout/models/order_item.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class OrderLine extends StatelessWidget {
  const OrderLine({super.key, required this.item});

  final OrderItem item;

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
          child: Text(item.thumbnail, style: const TextStyle(fontSize: 22)),
        ),
        Expanded(
          child: Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        CircleIconButton(
          icon: item.destructiveControl ? Icons.delete_outline : Icons.remove,
          onPressed: () {},
          foregroundColor: item.destructiveControl
              ? AppColors.danger
              : AppColors.inkMuted,
          backgroundColor: item.destructiveControl
              ? AppColors.dangerSurface
              : AppColors.neutralSurface,
        ),
        Text(
          item.quantity.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        CircleIconButton(
          icon: Icons.add,
          onPressed: () {},
          foregroundColor: AppColors.inkMuted,
          backgroundColor: AppColors.neutralSurface,
        ),
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
