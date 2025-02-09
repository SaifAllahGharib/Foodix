import 'package:yummy_home/core/models/user_model.dart';

abstract class DBServices {
  Future<UserModel> getUser();

  Future<void> setUser(UserModel user, String uid);
}
