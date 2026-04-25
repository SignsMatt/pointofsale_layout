import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product_category.dart';

class FilterButtonBar extends StatelessWidget {
  const FilterButtonBar({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final ProductCategory selectedCategory;
  final ValueChanged<ProductCategory> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 12,
        children: [
          for (final category in ProductCategory.values)
            ChoiceChip(
              label: Text(category.label),
              selected: selectedCategory == category,
              onSelected: (_) => onCategorySelected(category),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
        ],
      ),
    );
  }
}
