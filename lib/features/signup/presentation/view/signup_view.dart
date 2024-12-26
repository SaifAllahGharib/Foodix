import 'package:flutter/material.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  static const id = "/";

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupViewBody(),
    );
  }
}
