import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/api.dart';
import 'package:yummy_home/features/login/data/repos/forget_password_repo_imp.dart';
import 'package:yummy_home/features/login/presentation/manager/cubits/forget_password/forget_password_cubit.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String id = "/forget-password";

  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgetPasswordCubit(ForgetPasswordRepositoryImp(Api(Dio()))),
      child: Scaffold(
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
