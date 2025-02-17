import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';
import 'package:yummy_home/features/add_food/data/models/food_model.dart';

class FirebaseDBServices extends DBServices {
  final FirebaseService _firebaseService;

  FirebaseDBServices(this._firebaseService);

  @override
  Future<DataSnapshot> getUser(String uid) async {
    return await _firebaseService.db.ref().child("users/$uid").get();
  }

  @override
  Future<void> setUser(UserModel user, String uid) async {
    await _firebaseService.db
        .ref()
        .child("users")
        .child(uid)
        .set(user.toJson());
  }

  @override
  Future<void> updateName(String uid, String name) async {
    await _firebaseService.db.ref().child("users/$uid").update({"name": name});
  }

  @override
  Future<void> addCategory(String uid, String categoryName) async {
    await _firebaseService.db
        .ref()
        .child("categories")
        .child(uid)
        .child(categoryName)
        .child("categoryName")
        .set(categoryName);
  }

  @override
  Future<void> addFood(String uid, String categoryName, FoodModel food) async {
    await _firebaseService.db
        .ref()
        .child("categories")
        .child(uid)
        .child(categoryName)
        .child("foods")
        .child(food.foodName)
        .set(food.toJson());
  }
}
