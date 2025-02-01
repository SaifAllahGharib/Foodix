import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  double _appBarHeight = 0.0;
  double _opacity = 0.0;
  int _selectedIndex = 0;
  final Map<int, int> _countOfProducts = {};

  RestaurantCubit() : super(RestaurantInitState());

  void showCategoryListView(double offSet) {
    _appBarHeight = offSet;
    emit(RestaurantShowCategoryListViewState(_appBarHeight));
  }

  void updateOpacity(double value) {
    _opacity = value;
    emit(RestaurantUpdateOpacityState(_opacity));
  }

  void onClickCategory(int index) {
    _selectedIndex = index;
    emit(RestaurantOnClickCategoryState(_selectedIndex));
  }

  void incrementCountOfProduct(int index) {
    _countOfProducts[index] = ((_countOfProducts[index] ?? 0) + 1);
    emit(RestaurantCounterState());
  }

  void decrementCountOfProduct(int index) {
    if ((_countOfProducts[index] ?? 0) > 0) {
      _countOfProducts[index] = ((_countOfProducts[index] ?? 0) - 1);
      emit(RestaurantCounterState());
    }
  }

  int countOfProducts(int index) => _countOfProducts[index] ?? 0;
}
