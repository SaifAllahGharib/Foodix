import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int _selectedIndex = 0;

  HomeCubit() : super(HomeChangeViewState(0));

  void changeTab(int index) {
    _selectedIndex = index;
    emit(HomeChangeViewState(_selectedIndex));
  }

  int get selectedIndex => _selectedIndex;
}
