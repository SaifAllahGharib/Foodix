import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInit());

  Future<void> pickImageFromCamera(ImagePickerHelper imagePickerHelper) async {
    File? selectedImage = await imagePickerHelper.pickImageFromCamera();
    emit(ProfilePickImage(selectedImage));
  }

  Future<void> pickImageFromGallery(ImagePickerHelper imagePickerHelper) async {
    File? selectedImage = await imagePickerHelper.pickImageFromGallery();
    emit(ProfilePickImage(selectedImage));
  }
}
