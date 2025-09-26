import 'food_model.dart';

class Restaurant {
  final int id;
  final String name;
  final String cuisine;
  final double rating;
  final String imageUrl; // added image URL
  final List<FoodItem> foods;

  Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.imageUrl, // added to constructor
    required this.foods,
  });
}
