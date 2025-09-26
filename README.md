# food_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## 📱 Demo App & Unit Tests

- Live App: [food_app](https://drive.google.com/file/d/1v1ofsyu-1rtId22pXon0RdUSnc9IuZBJ/view?usp=sharing)
- Unit Tests: [food_app/tests](https://github.com/YourUsername/food_app/tree/main/test)

---

## 🧪 Testing Workflow

This app uses **BLoC architecture**. The test structure is organized by layer:

| Layer       | What’s tested                                                     | Example test case                                                                 |
|-------------|-------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Bloc        | States emitted correctly given certain events                    | `RestaurantBloc`: on `FetchRestaurantsEvent` → emits `Loading`, then `Loaded`     |
| Repository  | Data returns list of restaurants / menus, handles errors         | `RestaurantRepository.getRestaurantList()` returns valid list; errors are caught  |
| UI / Widget | UI responds to bloc states                                       | Loading shows progress, loaded shows list, error shows error message              |
| Integration | Full flow: select restaurant → view menu → add to cart → checkout | Navigating through app updates UI and BLoC states accordingly                     |

---

## ⚙ How to Run Tests

