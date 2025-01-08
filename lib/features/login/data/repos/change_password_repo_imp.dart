import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/core/utils/api.dart';
import 'package:yummy_home/features/login/data/models/change_password_model.dart';
import 'package:yummy_home/features/login/data/repos/change_password_repo.dart';

class ChangePasswordRepositoryImp extends ChangePasswordRepository {
  final Api _api;

  ChangePasswordRepositoryImp(this._api);

  @override
  Future<Either<Failure, ResponseModel>> changePassword(
      ChangePasswordModel changePassword) async {
    try {
      var response = await _api.post(
        endPoint: "auth/change_password.php",
        data: changePassword.toJson(),
      );

      return right(ResponseModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
