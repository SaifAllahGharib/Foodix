import 'package:yummy_home/core/models/response.dart';

sealed class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final ResponseModel response;

  LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String errorMsg;

  LoginFailure(this.errorMsg);
}

class LoginShowPassword extends LoginState {
  final bool showPassword;

  LoginShowPassword(this.showPassword);
}

class LoginButtonIsEnabled extends LoginState {
  final bool buttonEnabled;

  LoginButtonIsEnabled(this.buttonEnabled);
}
