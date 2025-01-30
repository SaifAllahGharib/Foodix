sealed class RestaurantState {}

class RestaurantInit extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {}

class RestaurantFailure extends RestaurantState {}

class RestaurantShowCategoryListView extends RestaurantState {
  final double appBarHeight;

  RestaurantShowCategoryListView(this.appBarHeight);
}

class RestaurantUpdateOpacity extends RestaurantState {
  final double opacity;

  RestaurantUpdateOpacity(this.opacity);
}

class RestaurantOnClickCategory extends RestaurantState {
  final int selectedIndex;

  RestaurantOnClickCategory(this.selectedIndex);
}
