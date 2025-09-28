# 🍔 Food App

A Flutter application for browsing restaurants, viewing menus, adding items to cart, and placing orders.  
Built with **BLoC architecture** for state management and follows clean architecture principles.

[Download Apk to test the app](https://drive.google.com/file/d/1bo9euJ1V2nuKHyfXDJ3GOFh3dDhX9xna/view?usp=sharing)

---

## 📱 Demo App

<table>
  <tr>
    <td><img src="assets/home_screen.jpeg" alt="Home Screen" width="720"/></td>
    <td><img src="assets/food_screen.jpeg" alt="Menu Screen" width="720"/></td>
    <td><img src="assets/cart_screen.jpeg" alt="Cart Screen" width="720"/></td>
  </tr>
  <tr>
    <td align="center"> Home</td>
    <td align="center"> Menu</td>
    <td align="center">Cart</td>
  </tr>
</table>

---

## 🧪 Testing Workflow

This app uses **BLoC architecture**. The test structure is organized by layer:

| Layer       | What’s tested                                                     | Example test case                                                                 |
|-------------|-------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Bloc        | States emitted correctly given certain events                    | `RestaurantBloc`: on `FetchRestaurantsEvent` → emits `Loading`, then `Loaded`     |
| Repository  | Data returns list of restaurants / menus, handles errors         | `RestaurantRepository.getRestaurantList()` returns valid list; errors are caught  |
| UI / Widget | UI responds to bloc states                                       | Loading shows progress, loaded shows list, error shows error message              |
| Integration | Full flow: select restaurant → view menu → add to cart → checkout | Navigating through app updates UI and BLoC states accordingly                     |
    
