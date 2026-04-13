import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product.dart';
import 'package:pointofsale_layout/models/product_category.dart';
import 'package:pointofsale_layout/widgets/filter_button_bar.dart';
import 'package:pointofsale_layout/widgets/header.dart';
import 'package:pointofsale_layout/widgets/product_grid.dart';

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

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: .start,
              children: [
                Header(),
                FilterButtonBar(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                Expanded(child: ProductGrid(products: filteredProducts)),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 350,
          child: ColoredBox(
            color: Colors.red,
            child: Column(
              children: [
                Expanded(
                  child: Text('Place Order Status and Checkout Elements Here.'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
