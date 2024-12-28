import 'package:yummy_home/core/models/response.dart';

abstract class SignupState {}

class SignupInit extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final ResponseModel response;

  SignupSuccess(this.response);
}

class SignupFailure extends SignupState {
  final String errorMsg;

  SignupFailure(this.errorMsg);
}

class ShowPasswordState extends SignupState {
  final bool showPassword;

  ShowPasswordState(this.showPassword);
}

class ButtonIsEnabledState extends SignupState {
  final bool buttonEnabled;

  ButtonIsEnabledState(this.buttonEnabled);
}
