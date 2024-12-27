import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';

abstract class SignupRepository {
  Future<Either<Failure, ResponseModel>> signup(SignupModel user);
}
