import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product_filter_category.dart';

class FilterButtonBar extends StatelessWidget {
  const FilterButtonBar({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<ProductFilterCategory> categories = ProductFilterCategory.values;
  final ProductFilterCategory selectedCategory;
  final ValueChanged<ProductFilterCategory> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        spacing: 12,
        children: [
          for (final category in categories)
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
