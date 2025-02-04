import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo_imp.dart';
import 'package:yummy_home/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  static const id = "/signup_view";
  final String type;

  const SignupView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<SignupRepositoryImp>()),
      child: Scaffold(
        body: SignupViewBody(type: type),
      ),
    );
  }
}
