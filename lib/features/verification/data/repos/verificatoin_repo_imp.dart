import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/core/utils/api.dart';
import 'package:yummy_home/features/verification/data/models/verify_code_model.dart';
import 'package:yummy_home/features/verification/data/repos/verificarion_repo.dart';

class VerificationRepositoryImp extends VerificationRepository {
  final Api _api;

  VerificationRepositoryImp(this._api);

  @override
  Future<Either<Failure, ResponseModel>> verifyCode(
      VerifyCodeModel code) async {
    try {
      var response =
          await _api.post(endPoint: "auth/verify.php", data: code.toJson());

      return right(ResponseModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponseModel>> reSendCode(String email) async {
    try {
      var response = await _api.post(
        endPoint: "auth/resend_code.php",
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
