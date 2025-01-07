import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, ResponseModel>> forgetPassword(String email);
}
