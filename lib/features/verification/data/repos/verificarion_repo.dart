import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/response.dart';
import 'package:yummy_home/features/verification/data/models/verify_code_model.dart';

abstract class VerificationRepository {
  Future<Either<Failure, ResponseModel>> verifyCode(VerifyCodeModel code);

  Future<Either<Failure, ResponseModel>> reSendCode(String email);
}
