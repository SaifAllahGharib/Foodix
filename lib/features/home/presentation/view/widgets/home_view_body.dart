import 'package:flutter/material.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/features/home/presentation/view/main_buyer_view.dart';
import 'package:yummy_home/features/home/presentation/view/main_seller_view.dart';
import 'package:yummy_home/features/home/presentation/view/orders_view.dart';
import 'package:yummy_home/features/home/presentation/view/profile_view.dart';

class HomeViewBody extends StatelessWidget {
  final int selectedIndex;
  final UserModel user;

  const HomeViewBody({
    super.key,
    required this.selectedIndex,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        if (getIt.get<MySharedPreferences>().getRoleUser() == "seller")
          const MainSellerView()
        else
          const MainBuyerView(),
        const OrdersView(),
        ProfileView(user: user),
      ],
    );
  }
}
