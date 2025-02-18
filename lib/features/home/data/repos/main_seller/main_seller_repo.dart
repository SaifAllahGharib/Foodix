import 'package:dartz/dartz.dart';
import 'package:yummy_home/core/errors/failure.dart';
import 'package:yummy_home/core/models/ProductModel.dart';

abstract class MainSellerRepository {
  Future<Either<Failure, void>> addCategory(
    ProductModel product,
  );

  Stream<Either<Failure, dynamic>> getCategories();
}
