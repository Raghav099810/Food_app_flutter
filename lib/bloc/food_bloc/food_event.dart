import '../../model/food_model.dart';

abstract class FoodEvent {}

class AddFood extends FoodEvent { final FoodItem food; AddFood(this.food);}
class RemoveFood extends FoodEvent { final FoodItem food; RemoveFood(this.food);}
class IncrementQuantity extends FoodEvent { final FoodItem food; IncrementQuantity(this.food);}
class DecrementQuantity extends FoodEvent { final FoodItem food; DecrementQuantity(this.food);}
