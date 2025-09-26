import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/home_screen.dart';
import 'package:food_app/service/data_service.dart';
import 'bloc/food_bloc/food_bloc.dart';
import 'bloc/restaurant_bloc/restaurant_bloc.dart';
import 'bloc/restaurant_bloc/restaurant_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              RestaurantBloc(MockDataService())..add(FetchRestaurants()),
        ),
        BlocProvider(create: (_) => FoodBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Ordering Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
