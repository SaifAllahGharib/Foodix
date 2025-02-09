

class VerificationRepositoryImp {
  VerificationRepositoryImp();

// @override
// Future<Either<Failure, ResponseModel>> verifyCode(
//     VerifyCodeModel code) async {
//   try {
//     var response =
//         await _api.post(endPoint: "auth/verify.php", data: code.toJson());
//
//     return right(ResponseModel.fromJson(response));
//   } catch (e) {
//     if (e is DioException) {
//       return left(ServerFailure.fromDioException(e));
//     }
//     return left(ServerFailure(e.toString()));
//   }
// }
//
// @override
// Future<Either<Failure, ResponseModel>> reSendCode(String email) async {
//   try {
//     var response = await _api.post(
//       endPoint: "auth/resend_code.php",
//       data: {"email": email},
//     );
//
//     return right(ResponseModel.fromJson(response));
//   } catch (e) {
//     if (e is DioException) {
//       return left(ServerFailure.fromDioException(e));
//     }
//     return left(ServerFailure(e.toString()));
//   }
// }
}
