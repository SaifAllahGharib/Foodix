import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';

class FirebaseDBServices extends DBServices {
  final FirebaseService _firebaseService;

  FirebaseDBServices(this._firebaseService);

  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> setUser(UserModel user, String uid) async {
    try {
      _firebaseService.db.ref().child("users").child(uid).set(user.toJson());
    } catch (e) {
      print("Error: $e");
    }
  }
}
