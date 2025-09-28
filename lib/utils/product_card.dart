import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/utils/netwrok_image.dart';

import '../bloc/food_bloc/food_bloc.dart';
import '../bloc/food_bloc/food_event.dart';
import '../bloc/food_bloc/food_state.dart';
import '../model/food_model.dart';
import '../model/restaurant_model.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.deepOrange.withOpacity(0.3),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.orange.shade50, Colors.orange.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            // Restaurant Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: networkImageHandler(imageUrl: restaurant.imageUrl),
              ),
            ),
            const SizedBox(width: 16),
            // Restaurant Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange.shade800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      restaurant.cuisine,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepOrange.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "View Menu",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrange.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final FoodItem food;

  const FoodItemCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          // Food Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: networkImageHandler(imageUrl: food.imageUrl),
          ),

          const SizedBox(width: 12),

          // Food Info + Add to Cart
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹${food.price} • ${food.calories} cal',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),

                  // Add / Quantity buttons
                  BlocBuilder<FoodBloc, FoodState>(
                    builder: (context, state) {
                      int quantity = 0;
                      if (state is FoodUpdated) {
                        final item = state.cart.firstWhere(
                          (c) => c.food.name == food.name,
                          orElse: () => CartItem(food: food, quantity: 0),
                        );
                        quantity = item.quantity;
                      }

                      return quantity == 0
                          ? ElevatedButton(
                              onPressed: () =>
                                  context.read<FoodBloc>().add(AddFood(food)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 20,
                                ),
                              ),
                              child: const Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.deepOrange,
                                  ),
                                  onPressed: () => context.read<FoodBloc>().add(
                                    DecrementQuantity(food),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.deepOrange,
                                  ),
                                  onPressed: () => context.read<FoodBloc>().add(
                                    IncrementQuantity(food),
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartItem item; // your cart item model

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: networkImageHandler(imageUrl: item.food.imageUrl),
        ),
        title: Text(
          item.food.name ?? 'N/A',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '₹${item.food.price} x ${item.quantity}',
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Icon(Icons.remove),
                onTap: () =>
                    context.read<FoodBloc>().add(DecrementQuantity(item.food)),
              ),
              Text('${item.quantity}'),
              GestureDetector(
                child: const Icon(Icons.add),
                onTap: () =>
                    context.read<FoodBloc>().add(IncrementQuantity(item.food)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
