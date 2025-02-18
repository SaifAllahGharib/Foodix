import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/features/home/data/repos/home/home_repo.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  int _selectedIndex = 0;

  HomeCubit(this._homeRepository) : super(HomeInitState()) {
    HomeChangeViewState(0);
  }

  void changeTab(int index) {
    _selectedIndex = index;
    emit(HomeChangeViewState(_selectedIndex));
  }

  void resetState() {
    _selectedIndex = 0;
    emit(HomeChangeViewState(_selectedIndex));
  }

  Future<void> getUser() async {
    emit(HomeLoadingState());
    final result = await _homeRepository.getUser();

    result.fold(
      (e) => emit(HomeFailureState(e.errorMsg)),
      (r) => emit(
        HomeSuccessState(UserModel.fromJson(r.value as Map)),
      ),
    );
  }

  int get selectedIndex => _selectedIndex;
}
