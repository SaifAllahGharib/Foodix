import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/core/utils/api.dart';
import 'package:yummy_home/features/login/data/repos/forget_password_repo.dart';

class ForgetPasswordRepositoryImp extends ForgetPasswordRepository {
  final Api _api;

  ForgetPasswordRepositoryImp(this._api);

  @override
  Future<Either<Failure, ResponseModel>> forgetPassword(String email) async {
    try {
      var response = await _api.post(
        endPoint: "auth/forget_password.php",
        data: {"email": email},
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
