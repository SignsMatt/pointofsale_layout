import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/order_item.dart';
import 'package:pointofsale_layout/models/product.dart';
import 'package:pointofsale_layout/models/product_category.dart';
import 'package:pointofsale_layout/sections/bottom_action_bar.dart';
import 'package:pointofsale_layout/sections/current_order_panel.dart';
import 'package:pointofsale_layout/sections/filter_button_bar.dart';
import 'package:pointofsale_layout/sections/header.dart';
import 'package:pointofsale_layout/sections/product_grid.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleThemeMode,
  });

  final bool isDarkMode;
  final VoidCallback onToggleThemeMode;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCategory = ProductCategory.allItems;
  var orderItems = <OrderItem>[];

  void _addProductToOrder(Product product) {
    setState(() {
      final existingIndex = orderItems.indexWhere(
        (item) => item.product == product,
      );

      if (existingIndex == -1) {
        orderItems = [...orderItems, OrderItem(product: product, quantity: 1)];
        return;
      }

      orderItems = [
        for (var i = 0; i < orderItems.length; i++)
          if (i == existingIndex)
            orderItems[i].copyWith(quantity: orderItems[i].quantity + 1)
          else
            orderItems[i],
      ];
    });
  }

  void _incrementOrderItem(OrderItem item) {
    setState(() {
      orderItems = [
        for (final orderItem in orderItems)
          if (orderItem.product == item.product)
            orderItem.copyWith(quantity: orderItem.quantity + 1)
          else
            orderItem,
      ];
    });
  }

  void _decrementOrderItem(OrderItem item) {
    setState(() {
      if (item.quantity == 1) {
        orderItems = [
          for (final orderItem in orderItems)
            if (orderItem.product != item.product) orderItem,
        ];
        return;
      }

      orderItems = [
        for (final orderItem in orderItems)
          if (orderItem.product == item.product)
            orderItem.copyWith(quantity: orderItem.quantity - 1)
          else
            orderItem,
      ];
    });
  }

  void _clearOrder() {
    setState(() {
      orderItems = [];
    });
  }

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
                        onProductSelected: _addProductToOrder,
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
                      child: CurrentOrderPanel(
                        orderItems: orderItems,
                        onIncrementItem: _incrementOrderItem,
                        onDecrementItem: _decrementOrderItem,
                        onClearOrder: _clearOrder,
                        isDarkMode: widget.isDarkMode,
                        onToggleThemeMode: widget.onToggleThemeMode,
                      ),
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
                        onProductSelected: _addProductToOrder,
                        onCategorySelected: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 370,
                      child: CurrentOrderPanel(
                        orderItems: orderItems,
                        onIncrementItem: _incrementOrderItem,
                        onDecrementItem: _decrementOrderItem,
                        onClearOrder: _clearOrder,
                        isDarkMode: widget.isDarkMode,
                        onToggleThemeMode: widget.onToggleThemeMode,
                      ),
                    ),
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
    required this.onProductSelected,
  });

  final List<Product> products;
  final ProductCategory selectedCategory;
  final ValueChanged<ProductCategory> onCategorySelected;
  final ValueChanged<Product> onProductSelected;

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
          Expanded(
            child: ProductGrid(
              products: products,
              onProductSelected: onProductSelected,
            ),
          ),
          const BottomActionBar(),
        ],
      ),
    );
  }
}
