import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/features/add_food/presentation/view/add_food_view.dart';
import 'package:yummy_home/features/cart/presentation/view/cart_view.dart';
import 'package:yummy_home/features/choose_language/presentation/view/choose_language_view.dart';
import 'package:yummy_home/features/choose_type/presentation/view/choose_type_view.dart';
import 'package:yummy_home/features/details_order/presentation/view/details_order_view.dart';
import 'package:yummy_home/features/food_details/presentation/view/food_details_view.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/presentation/view/change_password_view.dart';
import 'package:yummy_home/features/login/presentation/view/forget_password_view.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/restaurant/presentation/view/restaurant_view.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';
import 'package:yummy_home/features/verification/presentation/view/verification_view.dart';
import 'package:yummy_home/features/your_addresses/view/your_addresses_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: MySharedPreferences().getInitRoute(),
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const ChooseLanguageView(),
      ),
      GoRoute(
        path: ChooseTypeView.id,
        builder: (context, state) => const ChooseTypeView(),
      ),
      GoRoute(
        path: SignupView.id,
        builder: (context, state) => SignupView(role: state.extra as String),
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
        builder: (context, state) =>
            VerificationView(email: state.extra as String),
      ),
      GoRoute(
        path: ForgetPasswordView.id,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: ChangePasswordView.id,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return ChangePasswordView(
            verifyCode: extra["code"] ?? "",
            user: extra["user"] ?? {},
          );
        },
      ),
      GoRoute(
        path: AddFoodView.id,
        builder: (context, state) =>
            AddFoodView(categoryName: state.extra as String),
      ),
      GoRoute(
        path: DetailsOrderView.id,
        builder: (context, state) => const DetailsOrderView(),
      ),
      GoRoute(
        path: FoodDetailsView.id,
        builder: (context, state) => const FoodDetailsView(),
      ),
      GoRoute(
        path: YourAddressesView.id,
        builder: (context, state) => const YourAddressesView(),
      ),
      GoRoute(
        path: RestaurantView.id,
        builder: (context, state) => const RestaurantView(),
      ),
      GoRoute(
        path: CartView.id,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
