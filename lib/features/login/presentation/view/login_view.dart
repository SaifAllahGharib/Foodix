import 'package:flutter/material.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const id = "/login_view";

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}
