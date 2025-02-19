import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';

abstract class MainBuyerRepository {
  Stream<Either<Failure, dynamic>> getRestaurants();
}
