import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodix/core/errors/failure.dart';

import '../../../../../core/shared/models/category_model.dart';

abstract class MainSellerRepository {
  Future<Either<Failure, void>> addCategory(CategoryModel category);

  Stream<Either<Failure, dynamic>> getCategories();

  Future<Either<Failure, DataSnapshot?>> getMyRestaurant();
}
