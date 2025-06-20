import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/features/home/data/repos/main_seller/main_seller_repo.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';
import 'package:foodix/features/my_restaurant/data/models/restaurant_model.dart';

import '../../../../../../core/shared/models/category_model.dart';
import '../../../../../../core/utils/my_shared_preferences.dart';

class MainSellerCubit extends Cubit<MainSellerState> {
  final MainSellerRepository _mainSellerRepository;
  final MySharedPreferences _mySharedPreferences;
  bool _isEnabled = false;
  StreamSubscription? _categorySubscription;

  MainSellerCubit(this._mainSellerRepository, this._mySharedPreferences)
    : super(MainSellerInit());

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }

  Future<void> addCategory(CategoryModel category) async {
    emit(MainSellerLoading());
    final result = await _mainSellerRepository.addCategory(category);

    result.fold(
      (l) => emit(MainSellerFailure(l.errorMsg)),
      (r) => emit(MainSellerAddCategory()),
    );
  }

  Future<void> getCategories() async {
    emit(MainSellerLoading());
    _categorySubscription?.cancel();

    _categorySubscription = _mainSellerRepository.getCategories().listen((
      result,
    ) {
      if (isClosed) return;
      result.fold(
        (l) => emit(MainSellerFailure(l.errorMsg)),
        (snapshot) => emit(MainSellerGetCategory(snapshot)),
      );
    });
  }

  Future<void> getMyRestaurant() async {
    final result = await _mainSellerRepository.getMyRestaurant();

    if (isClosed) return;
    result.fold(
      (l) => emit(MainSellerFailure(l.errorMsg)),
      (restaurant) => emit(
        MainSellerGetMyRestaurant(
          RestaurantModel.fromJson(restaurant?.value as Map? ?? {}),
        ),
      ),
    );
  }

  Future<bool> storeRestaurantInLocalDB(RestaurantModel restaurant) async {
    try {
      await Future.wait([
        _mySharedPreferences.storeString("restaurantName", restaurant.name!),
        _mySharedPreferences.storeString(
          "deliveryTime",
          restaurant.deliveryTime.toString(),
        ),
        _mySharedPreferences.storeString(
          "deliveryCost",
          restaurant.deliveryCost.toString(),
        ),
        _mySharedPreferences.storeString("openTime", restaurant.openTime!),
        _mySharedPreferences.storeString("closeTime", restaurant.closeTime!),
      ]);
      return true;
    } catch (_) {
      return false;
    }
  }

  void enableButton(TextEditingController controller) {
    _isEnabled = controller.text.isNotEmpty;
    emit(MainSellerEnableButton());
  }

  bool get isEnabled => _isEnabled;
}
