import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/functions/is_valid_email.dart';
import 'package:yummy_home/features/login/data/repos/forget_password_repo.dart';
import 'package:yummy_home/features/login/presentation/viewmodel/cubits/forget_password/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepository _forgetPasswordRepository;
  bool _buttonEnabled = false;

  ForgetPasswordCubit(this._forgetPasswordRepository)
      : super(ForgetPasswordInit());

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());

    var result = await _forgetPasswordRepository.forgetPassword(email);

    result.fold(
      (e) => emit(ForgetPasswordFailure(e.errorMsg)),
      (email) => emit(ForgetPasswordSuccess(email)),
    );
  }

  void validationFields({required TextEditingController email}) {
    _buttonEnabled = email.text.isNotEmpty && isValidEmail(email.text);
    emit(ForgetPasswordButtonIsEnabled(_buttonEnabled));
  }

  bool get buttonEnabled => _buttonEnabled;
}
