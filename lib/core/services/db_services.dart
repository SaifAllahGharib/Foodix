import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';

abstract class DBServices {
  Future<DataSnapshot> getUser(String uid);

  Future<void> setUser(SignupModel user, String uid);
}
