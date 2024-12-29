import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/features/login/data/models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, ResponseModel>> login(LoginModel user);
}
