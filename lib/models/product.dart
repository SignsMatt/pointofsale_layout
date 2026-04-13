import 'package:pointofsale_layout/models/product_category.dart';

class Product {
  const Product({
    required this.name,
    required this.weightGrams,
    required this.price,
    required this.category,
    required this.thumbnail,
  });

  final String name;
  final int weightGrams;
  final double price;
  final ProductCategory category;
  final String thumbnail;
}

const dummyProducts = <Product>[
  Product(
    name: 'Grilled Corn',
    weightGrams: 150,
    price: 1.75,
    category: ProductCategory.food,
    thumbnail: '🌽',
  ),
  Product(
    name: 'Ranch Burgers',
    weightGrams: 150,
    price: 7.75,
    category: ProductCategory.food,
    thumbnail: '🍔',
  ),
  Product(
    name: 'Bacon Pizza',
    weightGrams: 150,
    price: 7.00,
    category: ProductCategory.food,
    thumbnail: '🍕',
  ),
  Product(
    name: 'Fettuccine Pasta',
    weightGrams: 150,
    price: 7.75,
    category: ProductCategory.food,
    thumbnail: '🍝',
  ),
  Product(
    name: 'Stuffed Flank Steak',
    weightGrams: 150,
    price: 13.50,
    category: ProductCategory.food,
    thumbnail: '🥩',
  ),
  Product(
    name: 'Tortillas',
    weightGrams: 150,
    price: 7.75,
    category: ProductCategory.food,
    thumbnail: '🌯',
  ),
  Product(
    name: 'Original Burgers',
    weightGrams: 150,
    price: 7.00,
    category: ProductCategory.food,
    thumbnail: '🍔',
  ),
  Product(
    name: 'Pancakes',
    weightGrams: 150,
    price: 1.75,
    category: ProductCategory.food,
    thumbnail: '🥞',
  ),
  Product(
    name: 'Pepperoni Pizza',
    weightGrams: 150,
    price: 13.50,
    category: ProductCategory.food,
    thumbnail: '🍕',
  ),
  Product(
    name: 'Iced Coffee',
    weightGrams: 300,
    price: 3.50,
    category: ProductCategory.coldDrinks,
    thumbnail: '🧋',
  ),
  Product(
    name: 'Lemonade',
    weightGrams: 300,
    price: 2.50,
    category: ProductCategory.coldDrinks,
    thumbnail: '🍋',
  ),
  Product(
    name: 'Berry Smoothie',
    weightGrams: 350,
    price: 4.25,
    category: ProductCategory.coldDrinks,
    thumbnail: '🥤',
  ),
  Product(
    name: 'Espresso',
    weightGrams: 120,
    price: 2.75,
    category: ProductCategory.hotDrinks,
    thumbnail: '☕',
  ),
  Product(
    name: 'Hot Chocolate',
    weightGrams: 220,
    price: 3.25,
    category: ProductCategory.hotDrinks,
    thumbnail: '🍫',
  ),
  Product(
    name: 'Chai Latte',
    weightGrams: 240,
    price: 3.75,
    category: ProductCategory.hotDrinks,
    thumbnail: '🍵',
  ),
  Product(
    name: 'Draft Beer',
    weightGrams: 355,
    price: 5.50,
    category: ProductCategory.alcohol,
    thumbnail: '🍺',
  ),
  Product(
    name: 'Red Wine',
    weightGrams: 150,
    price: 8.25,
    category: ProductCategory.alcohol,
    thumbnail: '🍷',
  ),
  Product(
    name: 'Margarita',
    weightGrams: 280,
    price: 9.00,
    category: ProductCategory.alcohol,
    thumbnail: '🍸',
  ),
];
