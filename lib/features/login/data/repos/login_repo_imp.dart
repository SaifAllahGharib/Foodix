

class LoginRepositoryImp {
  LoginRepositoryImp();

// @override
// Future<Either<Failure, ResponseModel>> login(LoginModel user) async {
//   try {
//     var response = await _api.post(
//       endPoint: "auth/login.php",
//       data: user.toJson(),
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
