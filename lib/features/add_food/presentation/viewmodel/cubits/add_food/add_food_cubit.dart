import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/features/add_food/data/models/food_model.dart';
import 'package:yummy_home/features/add_food/data/repos/add_food_repo.dart';
import 'package:yummy_home/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';

class AddFoodCubit extends Cubit<AddFoodState> {
  final AddFoodRepository _addFoodRepository;
  final ImagePickerHelper _imagePickerHelper;
  bool _isValid = false;

  AddFoodCubit(this._addFoodRepository, this._imagePickerHelper)
      : super(AddFoodInit());

  Future<void> pickImageFromCamera() async {
    File? selectedImage = await _imagePickerHelper.pickImageFromCamera();
    emit(AddFoodPickImage(selectedImage));
  }

  Future<void> pickImageFromGallery() async {
    File? selectedImage = await _imagePickerHelper.pickImageFromGallery();
    emit(AddFoodPickImage(selectedImage));
  }

  void validation({
    required TextEditingController name,
    required TextEditingController desc,
    required TextEditingController price,
    required File? image,
  }) {
    _isValid = name.text.isNotEmpty &&
        desc.text.isNotEmpty &&
        price.text.isNotEmpty &&
        image != null;
    emit(AddFoodValidation(_isValid));
  }

  Future<void> addFood(String uid, String categoryName, FoodModel food) async {
    emit(AddFoodLoading());
    final result = await _addFoodRepository.addFood(uid, categoryName, food);

    result.fold(
      (l) => emit(AddFoodFailure(l.errorMsg)),
      (r) => emit(AddFoodSuccess()),
    );
  }

  bool get isValid => _isValid;
}
