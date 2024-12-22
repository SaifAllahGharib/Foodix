import 'package:go_router/go_router.dart';
import 'package:yummy_home/features/onboarding/presentation/view/onboarding_view.dart';

abstract class AppRouter {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingView(),
    ),
  ]);
}
