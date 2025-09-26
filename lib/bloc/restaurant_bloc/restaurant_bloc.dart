import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/restaurant_bloc/restaurant_event.dart';
import 'package:food_app/bloc/restaurant_bloc/restaurant_state.dart';
import '../../service/data_service.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final MockDataService service;

  RestaurantBloc(this.service) : super(RestaurantInitial()) {
    on<FetchRestaurants>((event, emit) async {
      emit(RestaurantLoadingState());
      try {
        final data = await service.fetchRestaurants();
        emit(RestaurantLoadedState(data));
      } catch (e) {
        emit(RestaurantErrorState(e.toString()));
      }
    });
  }
}
