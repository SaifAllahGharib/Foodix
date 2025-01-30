import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/restaurant/manager/cubits/restaurant/restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  double _appBarHeight = 0.0;
  double _opacity = 0.0;
  int _selectedIndex = 0;

  RestaurantCubit() : super(RestaurantInit());

  void showCategoryListView(double offSet) {
    _appBarHeight = offSet;
    emit(RestaurantShowCategoryListView(_appBarHeight));
  }

  void updateOpacity(double value) {
    _opacity = value;
    emit(RestaurantUpdateOpacity(_opacity));
  }

  void onClickCategory(int index) {
    _selectedIndex = index;
    emit(RestaurantOnClickCategory(_selectedIndex));
  }
}
