import 'package:pointofsale_layout/models/product.dart';

class OrderItem {
  const OrderItem({required this.product, required this.quantity});

  final Product product;
  final int quantity;

  double get totalPrice => product.price * quantity;

  OrderItem copyWith({int? quantity}) {
    return OrderItem(product: product, quantity: quantity ?? this.quantity);
  }
}
