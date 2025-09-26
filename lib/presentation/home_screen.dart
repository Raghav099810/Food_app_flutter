import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/restaurant_bloc/restaurant_event.dart';

import '../bloc/restaurant_bloc/restaurant_bloc.dart';
import '../bloc/restaurant_bloc/restaurant_state.dart';
import '../utils/product_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()
      async{
        context.read<RestaurantBloc>().add(FetchRestaurants());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade400,
          title: const Text("Local Restaurants"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BlocBuilder<RestaurantBloc, RestaurantState>(
            builder: (context, state) {
              if (state is RestaurantLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RestaurantLoadedState) {
                final restaurants = state.restaurantData;
                return ListView.builder(
                  itemCount: restaurants.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                RestaurantDetailScreen(restaurant: restaurant),
                          ),
                        );
                      },
                      child: RestaurantCard(restaurant: restaurant),
                    );
                  },
                );
              } else if (state is RestaurantErrorState) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
