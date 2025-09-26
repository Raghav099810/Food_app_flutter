class FoodItem {
  final String? name;
  final int? price;
  final int? calories;
  final String? imageUrl;

  FoodItem({
    this.name,
    this.price,
    this.calories,
    this.imageUrl,
  });
}

class CartItem {
  final FoodItem food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}
