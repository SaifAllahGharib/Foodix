import 'package:yummy_home/core/models/response.dart';

abstract class VerificationState {}

class VerificationInit extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {
  final ResponseModel response;

  VerificationSuccess(this.response);
}

class VerificationReSendCode extends VerificationState {
  final ResponseModel response;

  VerificationReSendCode(this.response);
}

class VerificationFailure extends VerificationState {
  final String errorMsg;

  VerificationFailure(this.errorMsg);
}

class VerificationTimerUpdated extends VerificationState {
  final int time;
  final bool canSend;

  VerificationTimerUpdated(this.time, this.canSend);
}
