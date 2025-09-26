import '../../model/food_model.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}
class FoodUpdated extends FoodState {
  final List<CartItem> cart;
  FoodUpdated(this.cart);
}
