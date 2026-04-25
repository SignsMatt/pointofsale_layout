import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product.dart';
import 'package:pointofsale_layout/models/product_category.dart';
import 'package:pointofsale_layout/sections/bottom_action_bar.dart';
import 'package:pointofsale_layout/sections/current_order_panel.dart';
import 'package:pointofsale_layout/sections/filter_button_bar.dart';
import 'package:pointofsale_layout/sections/header.dart';
import 'package:pointofsale_layout/sections/product_grid.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCategory = ProductCategory.allItems;

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == ProductCategory.allItems
        ? dummyProducts
        : dummyProducts
              .where((product) => product.category == selectedCategory)
              .toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 1120;
            const compactCatalogHeight = 750.0;
            const compactOrderPanelHeight = 690.0;
            const desktopMinHeight = 690.0;

            if (isCompact) {
              return SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(
                      height: compactCatalogHeight,
                      child: _CatalogSection(
                        products: filteredProducts,
                        selectedCategory: selectedCategory,
                        onCategorySelected: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: compactOrderPanelHeight,
                      width: double.infinity,
                      child: const CurrentOrderPanel(),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight < desktopMinHeight
                    ? desktopMinHeight
                    : constraints.maxHeight,
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: _CatalogSection(
                        products: filteredProducts,
                        selectedCategory: selectedCategory,
                        onCategorySelected: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 370, child: CurrentOrderPanel()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CatalogSection extends StatelessWidget {
  const _CatalogSection({
    required this.products,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<Product> products;
  final ProductCategory selectedCategory;
  final ValueChanged<ProductCategory> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const Header(),
          FilterButtonBar(
            selectedCategory: selectedCategory,
            onCategorySelected: onCategorySelected,
          ),
          Expanded(child: ProductGrid(products: products)),
          const BottomActionBar(),
        ],
      ),
    );
  }
}
