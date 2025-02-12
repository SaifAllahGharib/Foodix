import 'package:firebase_database/firebase_database.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';

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
}
