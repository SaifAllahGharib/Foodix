import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/core/utils/api.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo.dart';

class SignupRepositoryImp extends SignupRepository {
  Api _api;

  SignupRepositoryImp(this._api);

  @override
  Future<Either<Failure, ResponseModel>> signup(SignupModel user) async {
    try {
      var response = await _api.post(
        endPoint: "register.php",
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
