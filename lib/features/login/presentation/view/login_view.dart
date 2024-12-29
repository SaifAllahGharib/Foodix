import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/features/login/data/repos/login_repo_imp.dart';
import 'package:yummy_home/features/login/presentation/manager/cubits/login/login_cubit.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const id = "/login_view";

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginRepositoryImp>()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
