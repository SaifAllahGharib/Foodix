import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';

abstract class MainSellerRepository {
  Future<Either<Failure, void>> addCategory(
    String uid,
    String categoryName,
  );
}
