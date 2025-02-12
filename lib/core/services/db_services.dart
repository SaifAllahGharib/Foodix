import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/core/models/user_model.dart';

abstract class DBServices {
  Future<DataSnapshot> getUser(String uid);

  Future<void> setUser(UserModel user, String uid);
}
