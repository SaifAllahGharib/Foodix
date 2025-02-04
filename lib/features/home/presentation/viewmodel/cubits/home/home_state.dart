sealed class HomeState {}

class HomeChangeViewState extends HomeState {
  final int selectedIndex;

  HomeChangeViewState(this.selectedIndex);
}
