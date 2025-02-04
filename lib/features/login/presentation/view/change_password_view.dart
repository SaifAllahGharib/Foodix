import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/features/login/data/repos/change_password_repo_imp.dart';
import 'package:yummy_home/features/login/presentation/viewmodel/cubits/change_password/change_password_cubit.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  static const String id = "/change_password";
  final String verifyCode;
  final Map<String, dynamic> user;

  const ChangePasswordView({
    super.key,
    required this.verifyCode,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        getIt.get<ChangePasswordRepositoryImp>(),
      ),
      child: Scaffold(
        body: ChangePasswordViewBody(
          verifyCode: verifyCode,
          user: user,
        ),
      ),
    );
  }
}
