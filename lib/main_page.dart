import 'package:flutter/material.dart';
import 'package:pointofsale_layout/models/product_filter_category.dart';
import 'package:pointofsale_layout/widgets/filter_button_bar.dart';
import 'package:pointofsale_layout/widgets/header.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCategory = ProductFilterCategory.allItems;
  @override
  Widget build(BuildContext context) {
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
