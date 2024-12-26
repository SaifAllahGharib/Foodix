import 'package:go_router/go_router.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';

abstract class AppRouter {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
