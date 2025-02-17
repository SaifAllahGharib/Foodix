import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/home/data/repos/main_seller/main_seller_repo.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';

class MainSellerCubit extends Cubit<MainSellerState> {
  final MainSellerRepository _mainSellerRepository;
  bool _isEnabled = false;

  MainSellerCubit(this._mainSellerRepository) : super(MainSellerInit());

  Future<void> addCategory(String uid, String categoryName) async {
    emit(MainSellerLoading());
    final result = await _mainSellerRepository.addCategory(uid, categoryName);

    result.fold(
      (l) => emit(MainSellerFailure(l.errorMsg)),
      (r) => emit(MainSellerAddCategory()),
    );
  }

  void enableButton(TextEditingController controller) {
    _isEnabled = controller.text.isNotEmpty;
    emit(MainSellerEnableButton());
  }

  bool get isEnabled => _isEnabled;
}
