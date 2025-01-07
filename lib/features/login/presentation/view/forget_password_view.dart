import 'package:flutter/material.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  static const String id = "/forget-password";

  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPasswordViewBody(),
    );
  }
}
