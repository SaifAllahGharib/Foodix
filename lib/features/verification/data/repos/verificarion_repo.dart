import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';

abstract class VerificationRepository {
  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, bool>> isEmailVerified();
}
