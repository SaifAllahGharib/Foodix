import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/home/data/repos/main_buyer/main_buyer_repo.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_buyer/main_buyer_state.dart';

class MainBuyerCubit extends Cubit<MainBuyerState> {
  final MainBuyerRepository _mainBuyerRepository;

  MainBuyerCubit(this._mainBuyerRepository) : super(MainBuyerInitState());

  Future<void> fetchMainBuyerRestaurants() async {
    emit(MainBuyerLoadingState());

    _mainBuyerRepository.getRestaurants().listen(
      (result) {
        result.fold(
          (l) => emit(MainBuyerFailureState(l.errorMsg)),
          (r) => emit(MainBuyerSuccessState(r)),
        );
      },
    );
  }
}
