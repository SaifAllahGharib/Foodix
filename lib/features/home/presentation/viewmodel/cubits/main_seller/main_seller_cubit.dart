import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/models/ProductModel.dart';
import 'package:yummy_home/features/home/data/repos/main_seller/main_seller_repo.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_seller/main_seller_state.dart';

class MainSellerCubit extends Cubit<MainSellerState> {
  final MainSellerRepository _mainSellerRepository;
  bool _isEnabled = false;

  MainSellerCubit(this._mainSellerRepository) : super(MainSellerInit());

  Future<void> addCategory(ProductModel product) async {
    emit(MainSellerLoading());
    final result = await _mainSellerRepository.addCategory(product);

    result.fold(
      (l) => emit(MainSellerFailure(l.errorMsg)),
      (r) => emit(MainSellerAddCategory()),
    );
  }

  Future<void> getCategories() async {
    emit(MainSellerLoading());
    _mainSellerRepository.getCategories().listen(
      (result) {
        result.fold(
          (l) => emit(MainSellerFailure(l.errorMsg)),
          (snapshot) => emit(MainSellerGetCategory(snapshot)),
        );
      },
    );
  }

  void enableButton(TextEditingController controller) {
    _isEnabled = controller.text.isNotEmpty;
    emit(MainSellerEnableButton());
  }

  bool get isEnabled => _isEnabled;
}
