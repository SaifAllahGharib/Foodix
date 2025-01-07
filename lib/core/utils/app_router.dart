import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/presentation/view/forget_password_view.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';
import 'package:yummy_home/features/verification/presentation/view/verification_view.dart';

abstract class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: SignupView.id,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: LoginView.id,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: HomeView.id,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: VerificationView.id,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final email = extra["email"] as String;
          final onPress = extra["onPress"] as Function(
              BuildContext context, String email, String code);

          return VerificationView(
            email: email,
            verify: onPress,
          );
        },
      ),
      GoRoute(
        path: ForgetPasswordView.id,
        builder: (context, state) => ForgetPasswordView(),
      ),
    ],
  );
}
