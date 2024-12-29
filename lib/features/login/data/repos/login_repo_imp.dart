import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/core/utils/api.dart';
import 'package:yummy_home/features/login/data/models/login_model.dart';
import 'package:yummy_home/features/login/data/repos/login_repo.dart';

class LoginRepositoryImp extends LoginRepository {
  Api _api;

  LoginRepositoryImp(this._api);

  @override
  Future<Either<Failure, ResponseModel>> login(LoginModel user) async {
    try {
      var response = await _api.post(
        endPoint: "login.php",
        data: user.toJson(),
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
