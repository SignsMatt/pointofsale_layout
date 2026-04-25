import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product.dart';
import 'package:pointofsale_layout/theme/app_colors.dart';
import 'package:pointofsale_layout/theme/app_theme_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final thumbnailSize = (constraints.maxWidth * 0.28).clamp(64.0, 150.0);
        final thumbnailEmojiSize = (thumbnailSize * 0.48).clamp(28.0, 110.0);

        return Material(
          color: colors.cardSurface,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: colors.subtleBorder),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${product.weightGrams}g',
                            style: TextStyle(
                              color: colors.inkMuted,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: AppColors.filterAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.mutedSurface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          height: thumbnailSize,
                          width: thumbnailSize,
                          child: Center(
                            child: Text(
                              product.thumbnail,
                              style: TextStyle(fontSize: thumbnailEmojiSize),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
