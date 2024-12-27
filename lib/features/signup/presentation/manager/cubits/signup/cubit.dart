import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/signup/presentation/manager/cubits/signup/state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInit());

  Future<void> signup() async {}
}
