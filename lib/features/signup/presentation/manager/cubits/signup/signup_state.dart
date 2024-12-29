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

class SignupShowPassword extends SignupState {
  final bool showPassword;

  SignupShowPassword(this.showPassword);
}

class SignupButtonIsEnabled extends SignupState {
  final bool buttonEnabled;

  SignupButtonIsEnabled(this.buttonEnabled);
}
