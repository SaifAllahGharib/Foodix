import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/features/login/data/models/change_password_model.dart';

abstract class ChangePasswordRepository {
  Future<Either<Failure, ResponseModel>> changePassword(
      ChangePasswordModel changePassword);
}
