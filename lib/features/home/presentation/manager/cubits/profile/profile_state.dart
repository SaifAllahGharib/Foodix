import 'dart:io';

sealed class ProfileState {}

class ProfileInit extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileFailure extends ProfileState {}

class ProfilePickImage extends ProfileState {
  final File? image;

  ProfilePickImage(this.image);
}
