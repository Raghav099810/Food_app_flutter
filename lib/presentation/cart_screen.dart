import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/utils/product_card.dart';
import '../bloc/food_bloc/food_bloc.dart';
import '../bloc/food_bloc/food_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.deepOrange.shade700,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodUpdated && state.cart.isNotEmpty) {
              final cart = state.cart;
              int total = cart.fold(
                0,
                (sum, item) =>
                    sum + (item.food.price ?? 0) * (item.quantity),
              );

              return Column(
                children: [
                  const SizedBox(height: 80),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return CartItemCard(item: item);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: ₹$total",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Handle checkout
                          },
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
            );
          },
        ),
      ),
    );
  }
}
