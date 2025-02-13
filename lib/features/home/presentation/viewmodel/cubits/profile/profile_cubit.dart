import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/features/home/data/repos/profile/profile_repo.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ImagePickerHelper _imagePickerHelper;
  final ProfileRepository _profileRepository;

  ProfileCubit(
    this._imagePickerHelper,
    this._profileRepository,
  ) : super(ProfileInitState());

  Future<void> pickImageFromCamera() async {
    File? selectedImage = await _imagePickerHelper.pickImageFromCamera();
    emit(ProfilePickImageState(selectedImage));
  }

  Future<void> pickImageFromGallery() async {
    File? selectedImage = await _imagePickerHelper.pickImageFromGallery();
    emit(ProfilePickImageState(selectedImage));
  }

  Future<void> signOut() async {
    emit(ProfileLoadingState());
    final result = await _profileRepository.signOut();
    result.fold(
      (e) => emit(ProfileFailureState(e.errorMsg)),
      (r) => emit(ProfileSignOutState()),
    );
  }
}
