import 'dart:math';
import '../model/food_model.dart';
import '../model/restaurant_model.dart';

class MockDataService {
  Future<List<Restaurant>> fetchRestaurants() async {
    await Future.delayed(const Duration(seconds: 1));
    if (Random().nextInt(10) < 2) {
      throw Exception("Failed to fetch restaurants");
    }

    return [
      // 1
      Restaurant(
        id: 1,
        name: 'Pizza Palace',
        cuisine: 'Italian',
        rating: 4.5,
        imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
        foods: [
          FoodItem(name: 'Margherita', price: 200, calories: 400, imageUrl: 'https://images.unsplash.com/photo-1594007656713-4f7edb1d67d2'),
          FoodItem(name: 'Pepperoni', price: 250, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1601924582975-bc7d6166e2b1'),
          FoodItem(name: 'Veggie Delight', price: 220, calories: 450, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
        ],
      ),
      // 2
      Restaurant(
        id: 2,
        name: 'Sushi World',
        cuisine: 'Japanese',
        rating: 4.8,
        imageUrl: 'https://images.unsplash.com/photo-1562967916-eb82221dfb25',
        foods: [
          FoodItem(name: 'Salmon Roll', price: 300, calories: 350, imageUrl: 'https://images.unsplash.com/photo-1600718371030-32b0b3d1de9d'),
          FoodItem(name: 'Tuna Roll', price: 320, calories: 360, imageUrl: 'https://images.unsplash.com/photo-1562157870-818bc0726da6'),
          FoodItem(name: 'Avocado Roll', price: 280, calories: 340, imageUrl: 'https://images.unsplash.com/photo-1589927986089-35812388d1e0'),
        ],
      ),
      // 3
      Restaurant(
        id: 3,
        name: 'Burger Haven',
        cuisine: 'American',
        rating: 4.2,
        imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349',
        foods: [
          FoodItem(name: 'Cheeseburger', price: 150, calories: 600, imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349'),
          FoodItem(name: 'Veggie Burger', price: 180, calories: 550, imageUrl: 'https://images.unsplash.com/photo-1606755962771-69d5be308a5f'),
          FoodItem(name: 'Bacon Burger', price: 200, calories: 650, imageUrl: 'https://images.unsplash.com/photo-1617196039463-040a80559a6a'),
        ],
      ),
      // 4
      Restaurant(
        id: 4,
        name: 'Curry House',
        cuisine: 'Indian',
        rating: 4.6,
        imageUrl: 'https://images.unsplash.com/photo-1617196039463-040a80559a6a',
        foods: [
          FoodItem(name: 'Butter Chicken', price: 250, calories: 700, imageUrl: 'https://images.unsplash.com/photo-1604908177522-6e1b9e360430'),
          FoodItem(name: 'Paneer Tikka', price: 220, calories: 650, imageUrl: 'https://images.unsplash.com/photo-1617196039463-040a80559a6a'),
          FoodItem(name: 'Dal Makhani', price: 200, calories: 600, imageUrl: 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90'),
        ],
      ),
      // 5
      Restaurant(
        id: 5,
        name: 'Taco Town',
        cuisine: 'Mexican',
        rating: 4.4,
        imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
        foods: [
          FoodItem(name: 'Chicken Taco', price: 120, calories: 400, imageUrl: 'https://images.unsplash.com/photo-1562967916-eb82221dfb25'),
          FoodItem(name: 'Beef Burrito', price: 200, calories: 700, imageUrl: 'https://images.unsplash.com/photo-1600718371030-32b0b3d1de9d'),
          FoodItem(name: 'Veggie Quesadilla', price: 180, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1589927986089-35812388d1e0'),
        ],
      ),
      // 6
      Restaurant(
        id: 6,
        name: 'Pasta Corner',
        cuisine: 'Italian',
        rating: 4.3,
        imageUrl: 'https://images.unsplash.com/photo-1589308078050-71c5a2c4d6a0',
        foods: [
          FoodItem(name: 'Spaghetti Bolognese', price: 220, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1604335399101-90b67b7e0d82'),
          FoodItem(name: 'Penne Alfredo', price: 230, calories: 550, imageUrl: 'https://images.unsplash.com/photo-1601924949128-0ed858f09d9b'),
          FoodItem(name: 'Lasagna', price: 250, calories: 600, imageUrl: 'https://images.unsplash.com/photo-1601924908172-2b1c47c92c47'),
        ],
      ),
      // 7
      Restaurant(
        id: 7,
        name: 'Dim Sum Delight',
        cuisine: 'Chinese',
        rating: 4.5,
        imageUrl: 'https://images.unsplash.com/photo-1598514983665-24b374c0b8c8',
        foods: [
          FoodItem(name: 'Pork Dumplings', price: 180, calories: 300, imageUrl: 'https://images.unsplash.com/photo-1598514983665-24b374c0b8c8'),
          FoodItem(name: 'Shrimp Dumplings', price: 200, calories: 320, imageUrl: 'https://images.unsplash.com/photo-1601924916330-3a2c9a4ff7a1'),
          FoodItem(name: 'Veggie Dumplings', price: 150, calories: 280, imageUrl: 'https://images.unsplash.com/photo-1601924916331-4a2b9a4ff7a2'),
        ],
      ),
      // 8
      Restaurant(
        id: 8,
        name: 'BBQ Barn',
        cuisine: 'American',
        rating: 4.6,
        imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349',
        foods: [
          FoodItem(name: 'Grilled Chicken', price: 250, calories: 700, imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349'),
          FoodItem(name: 'BBQ Ribs', price: 300, calories: 800, imageUrl: 'https://images.unsplash.com/photo-1601924928359-2f1b4e8d7b3c'),
          FoodItem(name: 'Smoked Brisket', price: 350, calories: 850, imageUrl: 'https://images.unsplash.com/photo-1601924928359-3f1b4e8d7b3d'),
        ],
      ),
      // 9
      Restaurant(
        id: 9,
        name: 'Greek Taverna',
        cuisine: 'Greek',
        rating: 4.4,
        imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
        foods: [
          FoodItem(name: 'Gyro', price: 180, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1600718371030-32b0b3d1de9d'),
          FoodItem(name: 'Souvlaki', price: 200, calories: 550, imageUrl: 'https://images.unsplash.com/photo-1600718371030-32b0b3d1de9d'),
          FoodItem(name: 'Greek Salad', price: 150, calories: 300, imageUrl: 'https://images.unsplash.com/photo-1589927986089-35812388d1e0'),
        ],
      ),
      // 10
      Restaurant(
        id: 10,
        name: 'Mediterranean Magic',
        cuisine: 'Mediterranean',
        rating: 4.5,
        imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1',
        foods: [
          FoodItem(name: 'Falafel Wrap', price: 180, calories: 400, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Hummus Plate', price: 150, calories: 350, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Shawarma', price: 200, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
        ],
      ),
      // 11
      Restaurant(
        id: 11,
        name: 'Thai Spice',
        cuisine: 'Thai',
        rating: 4.6,
        imageUrl: 'https://images.unsplash.com/photo-1601924928359-2f1b4e8d7b3c',
        foods: [
          FoodItem(name: 'Pad Thai', price: 220, calories: 550, imageUrl: 'https://images.unsplash.com/photo-1601924928359-2f1b4e8d7b3c'),
          FoodItem(name: 'Green Curry', price: 230, calories: 600, imageUrl: 'https://images.unsplash.com/photo-1601924928359-3f1b4e8d7b3d'),
          FoodItem(name: 'Tom Yum Soup', price: 180, calories: 400, imageUrl: 'https://images.unsplash.com/photo-1601924928359-3f1b4e8d7b3d'),
        ],
      ),
      // 12
      Restaurant(
        id: 12,
        name: 'Korean BBQ',
        cuisine: 'Korean',
        rating: 4.7,
        imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1',
        foods: [
          FoodItem(name: 'Bulgogi', price: 250, calories: 650, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Kimchi Fried Rice', price: 200, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Japchae', price: 220, calories: 550, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
        ],
      ),
      // 13
      Restaurant(
        id: 13,
        name: 'Mediterraneo',
        cuisine: 'Italian',
        rating: 4.5,
        imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
        foods: [
          FoodItem(name: 'Risotto', price: 220, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092'),
          FoodItem(name: 'Gnocchi', price: 200, calories: 450, imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092'),
          FoodItem(name: 'Fettuccine Alfredo', price: 230, calories: 550, imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092'),
        ],
      ),
      // 14
      Restaurant(
        id: 14,
        name: 'Vegan Delight',
        cuisine: 'Vegan',
        rating: 4.6,
        imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1',
        foods: [
          FoodItem(name: 'Vegan Burger', price: 180, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Vegan Salad', price: 150, calories: 350, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Vegan Wrap', price: 200, calories: 400, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
        ],
      ),
      // 15
      Restaurant(
        id: 15,
        name: 'Dessert Haven',
        cuisine: 'Dessert',
        rating: 4.8,
        imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1',
        foods: [
          FoodItem(name: 'Chocolate Cake', price: 120, calories: 500, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Cheesecake', price: 150, calories: 450, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
          FoodItem(name: 'Ice Cream Sundae', price: 100, calories: 300, imageUrl: 'https://images.unsplash.com/photo-1601924928360-903e2764f6c1'),
        ],
      ),
    ];
  }
}
