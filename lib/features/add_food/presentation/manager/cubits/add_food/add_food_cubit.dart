import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/features/add_food/presentation/manager/cubits/add_food/add_food_state.dart';

class AddFoodCubit extends Cubit<AddFoodState> {
  bool _isValid = false;

  AddFoodCubit() : super(AddFoodInit());

  Future<void> pickImageFromCamera(ImagePickerHelper imagePickerHelper) async {
    File? selectedImage = await imagePickerHelper.pickImageFromCamera();
    emit(AddFoodPickImage(selectedImage));
  }

  Future<void> pickImageFromGallery(ImagePickerHelper imagePickerHelper) async {
    File? selectedImage = await imagePickerHelper.pickImageFromGallery();
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

  bool get isValid => _isValid;
}
