import '../../model/restaurant_model.dart';

abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}
class RestaurantLoadingState extends RestaurantState {}
class RestaurantLoadedState extends RestaurantState {
  final List<Restaurant> restaurantData;
  RestaurantLoadedState(this.restaurantData);
}
class RestaurantErrorState extends RestaurantState {
  final String message;
  RestaurantErrorState(this.message);
}
