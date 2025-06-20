import 'package:dartz/dartz.dart';
import 'package:foodix/core/errors/failure.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

abstract class MyRestaurantRepository {
  Future<Either<Failure, void>> createRestaurant(RestaurantModel restaurant);

  Future<Either<Failure, void>> updateRestaurantName(String name);

  Future<Either<Failure, void>> updateRestaurantTimeDelivery(int time);

  Future<Either<Failure, void>> updateRestaurantCostDelivery(int cost);

  Future<Either<Failure, void>> updateRestaurantOpenTime(String openTime);

  Future<Either<Failure, void>> updateRestaurantCloseTime(String closeTime);
}
