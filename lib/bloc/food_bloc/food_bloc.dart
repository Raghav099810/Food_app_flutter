import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/food_model.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final List<CartItem> cart = [];

  FoodBloc() : super(FoodInitial()) {
    on<AddFood>((event, emit) {
      final existing = cart.indexWhere((c) => c.food.name == event.food.name);
      if (existing >= 0) {
        cart[existing].quantity++;
      } else {
        cart.add(CartItem(food: event.food));
      }
      emit(FoodUpdated(List.from(cart)));
    });

    on<RemoveFood>((event, emit) {
      cart.removeWhere((c) => c.food.name == event.food.name);
      emit(FoodUpdated(List.from(cart)));
    });

    on<IncrementQuantity>((event, emit) {
      final index = cart.indexWhere((c) => c.food.name == event.food.name);
      if (index >= 0) {
        cart[index].quantity++;
        emit(FoodUpdated(List.from(cart)));
      }
    });

    on<DecrementQuantity>((event, emit) {
      final index = cart.indexWhere((c) => c.food.name == event.food.name);
      if (index >= 0 && cart[index].quantity > 1) {
        cart[index].quantity--;
        emit(FoodUpdated(List.from(cart)));
      } else if (index >= 0) {
        cart.removeAt(index);
        emit(FoodUpdated(List.from(cart)));
      }
    });
  }
}
