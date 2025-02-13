import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> signOut();
}
