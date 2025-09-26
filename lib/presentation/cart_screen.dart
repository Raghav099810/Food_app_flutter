import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/utils/netwrok_image.dart';
import '../bloc/food_bloc/food_bloc.dart';
import '../bloc/food_bloc/food_event.dart';
import '../bloc/food_bloc/food_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
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
                    sum + (item.food.price ?? 0) * (item.quantity ?? 0),
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
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 4,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: networkImageHandler(
                                imageUrl: item.food.imageUrl,
                              ),
                            ),
                            title: Text(
                              item.food.name ?? 'N/A',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '₹${item.food.price} x ${item.quantity}',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => context
                                        .read<FoodBloc>()
                                        .add(DecrementQuantity(item.food)),
                                  ),
                                  Text('${item.quantity}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => context
                                        .read<FoodBloc>()
                                        .add(IncrementQuantity(item.food)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
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
