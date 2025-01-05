import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/verification/data/models/verify_code_model.dart';
import 'package:yummy_home/features/verification/data/repos/verificarion_repo.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepository _verificationRepository;

  VerificationCubit(this._verificationRepository) : super(VerificationInit());

  Future<void> verifyCode(VerifyCodeModel code) async {
    emit(VerificationLoading());

    var result = await _verificationRepository.verifyCode(code);

    result.fold(
      (e) => emit(VerificationFailure(e.errorMsg)),
      (code) => emit(VerificationSuccess(code)),
    );
  }
}
