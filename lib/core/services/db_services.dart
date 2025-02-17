import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/features/add_food/data/models/food_model.dart';

abstract class DBServices {
  Future<DataSnapshot> getUser(String uid);

  Future<void> setUser(UserModel user, String uid);

  Future<void> updateName(String uid, String name);

  Future<void> addCategory(String uid, String categoryName);

  Future<void> addFood(String uid, String categoryName, FoodModel food);
}
