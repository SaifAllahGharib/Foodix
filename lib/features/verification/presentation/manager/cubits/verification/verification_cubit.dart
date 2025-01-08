import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/verification/data/models/verify_code_model.dart';
import 'package:yummy_home/features/verification/data/repos/verificarion_repo.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepository _verificationRepository;
  bool _canSend = false;
  int _time = 60;
  Timer? _timer;

  VerificationCubit(this._verificationRepository) : super(VerificationInit());

  Future<void> verifyCode(VerifyCodeModel code) async {
    emit(VerificationLoading());

    var result = await _verificationRepository.verifyCode(code);

    result.fold(
      (e) => emit(VerificationFailure(e.errorMsg)),
      (code) => emit(VerificationSuccess(code)),
    );
  }

  Future<void> reSendCode(String email) async {
    startTimer();

    var result = await _verificationRepository.reSendCode(email);

    result.fold(
      (e) => emit(VerificationFailure(e.errorMsg)),
      (code) => emit(VerificationReSendCode(code)),
    );
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _canSend = false;
    _time = 60;
    emit(VerificationTimerUpdated(_time, _canSend));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time > 0) {
        _time--;
        emit(VerificationTimerUpdated(_time, _canSend));
      } else {
        _timer?.cancel();
        _canSend = true;
        emit(
          VerificationTimerUpdated(
            _time,
            _canSend,
          ),
        );
      }
    });
  }

  bool get canSend => _canSend;

  int get time => _time;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
