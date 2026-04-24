import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _crossAxisCountForWidth(constraints.maxWidth);

        return Stack(
          children: [
            GridView.builder(
              padding: const EdgeInsets.only(bottom: 56),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.9,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 60,
              child: IgnorePointer(child: _ProductGridFade()),
            ),
          ],
        );
      },
    );
  }

  int _crossAxisCountForWidth(double width) {
    if (width >= 1050) return 4;
    if (width >= 720) return 3;
    if (width >= 450) return 2;
    return 1;
  }
}

class _ProductGridFade extends StatelessWidget {
  const _ProductGridFade();

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
