class OrderItem {
  const OrderItem({
    required this.name,
    required this.quantity,
    required this.totalPrice,
    required this.thumbnail,
    this.destructiveControl = false,
  });

  final String name;
  final int quantity;
  final double totalPrice;
  final String thumbnail;
  final bool destructiveControl;
}

const orderItems = <OrderItem>[
  OrderItem(
    name: 'Stuffed Flank Steak',
    quantity: 1,
    totalPrice: 13.50,
    thumbnail: '🥩',
    destructiveControl: true,
  ),
  OrderItem(
    name: 'Grilled Corn',
    quantity: 2,
    totalPrice: 3.50,
    thumbnail: '🌽',
  ),
  OrderItem(
    name: 'Ranch Burgers',
    quantity: 2,
    totalPrice: 7.75,
    thumbnail: '🍔',
  ),
  OrderItem(
    name: 'Mushroom Burgers',
    quantity: 2,
    totalPrice: 3.50,
    thumbnail: '🍄',
  ),
  OrderItem(
    name: 'Mushroom Burgers',
    quantity: 2,
    totalPrice: 3.50,
    thumbnail: '🍄',
  ),
];
