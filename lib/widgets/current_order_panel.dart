import 'package:flutter/material.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';

class CurrentOrderPanel extends StatelessWidget {
  const CurrentOrderPanel({super.key});

  static const _orderItems = <_OrderItem>[
    _OrderItem(
      name: 'Stuffed Flank Steak',
      quantity: 1,
      totalPrice: 13.50,
      thumbnail: '🥩',
      destructiveControl: true,
    ),
    _OrderItem(
      name: 'Grilled Corn',
      quantity: 2,
      totalPrice: 3.50,
      thumbnail: '🌽',
    ),
    _OrderItem(
      name: 'Ranch Burgers',
      quantity: 2,
      totalPrice: 7.75,
      thumbnail: '🍔',
    ),
    _OrderItem(
      name: 'Mushroom Burgers',
      quantity: 2,
      totalPrice: 3.50,
      thumbnail: '🍄',
    ),
    _OrderItem(
      name: 'Mushroom Burgers',
      quantity: 2,
      totalPrice: 3.50,
      thumbnail: '🍄',
    ),
  ];

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
                _FlatTagButton(
                  label: 'Clear All',
                  foreground: AppColors.danger,
                  background: AppColors.dangerSurface,
                ),
                _CircleIconButton(icon: Icons.settings, onPressed: () {}),
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
                          itemCount: _orderItems.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 15),
                          itemBuilder: (context, index) {
                            return _OrderLine(item: _orderItems[index]);
                          },
                        ),
                        const Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          height: 56,
                          child: IgnorePointer(child: _OrderListFade()),
                        ),
                      ],
                    ),
                  ),
                  const _TotalsCard(),
                  const _CashlessCreditCard(),
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

class _OrderLine extends StatelessWidget {
  const _OrderLine({required this.item});

  final _OrderItem item;

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
        _CircleIconButton(
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
        _CircleIconButton(
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

class _OrderListFade extends StatelessWidget {
  const _OrderListFade();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white.withValues(alpha: 0), AppColors.white],
        ),
      ),
    );
  }
}

class _TotalsCard extends StatelessWidget {
  const _TotalsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: const Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            _PriceLine(label: 'Subtotal', amount: 35.25),
            SizedBox(height: 6),
            _PriceLine(label: 'Discounts', amount: -5.00),
            SizedBox(height: 6),
            _PriceLine(label: 'Sales Tax', amount: 2.25),
            SizedBox(height: 12),
            Divider(height: 1),
            SizedBox(height: 12),
            _PriceLine(label: 'Total', amount: 37.50, emphasize: true),
          ],
        ),
      ),
    );
  }
}

class _PriceLine extends StatelessWidget {
  const _PriceLine({
    required this.label,
    required this.amount,
    this.emphasize = false,
  });

  final String label;
  final double amount;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: emphasize ? AppColors.inkStrong : AppColors.inkMuted,
            fontSize: emphasize ? 22 : 16,
            fontWeight: emphasize ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: emphasize ? 22 : 16,
            fontWeight: FontWeight.w700,
            color: AppColors.inkStrong,
          ),
        ),
      ],
    );
  }
}

class _CashlessCreditCard extends StatelessWidget {
  const _CashlessCreditCard();

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
            _FlatTagButton(label: 'Cancel'),
          ],
        ),
      ),
    );
  }
}

class _FlatTagButton extends StatelessWidget {
  const _FlatTagButton({
    required this.label,
    this.foreground = AppColors.inkStrong,
    this.background = AppColors.subduedSurface,
  });

  final String label;
  final Color foreground;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: foreground,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onPressed,
    this.foregroundColor = AppColors.inkMuted,
    this.backgroundColor = AppColors.neutralSurface,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Icon(icon, size: 18, color: foregroundColor),
        ),
      ),
    );
  }
}

class _OrderItem {
  const _OrderItem({
    required this.name,
    required this.quantity,
    required this.totalPrice,
    required this.thumbnail,
    this.destructiveControl = false,
  });

  final String name;
  final int quantity;
  final double totalPrice;
  final String thumbnail;
  final bool destructiveControl;
}
