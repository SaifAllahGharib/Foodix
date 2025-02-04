import 'dart:io';

sealed class AddFoodState {}

class AddFoodInit extends AddFoodState {}

class AddFoodLoading extends AddFoodState {}

class AddFoodSuccess extends AddFoodState {}

class AddFoodFailure extends AddFoodState {}

class AddFoodPickImage extends AddFoodState {
  final File? image;

  AddFoodPickImage(this.image);
}

class AddFoodValidation extends AddFoodState {
  final bool isValid;

  AddFoodValidation(this.isValid);
}
