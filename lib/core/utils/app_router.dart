import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
