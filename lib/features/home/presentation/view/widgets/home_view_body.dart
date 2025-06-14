import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/features/home/presentation/view/main_seller_view.dart';
import 'package:yummy_home/features/home/presentation/view/orders_view.dart';
import 'package:yummy_home/features/home/presentation/view/profile_view.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';

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
        const MainSellerView(),
        // MainBuyerView(),
        BlocProvider(
          create: (context) => OrdersCubit(),
          child: const OrdersView(),
        ),
        ProfileView(user: user),
      ],
    );
  }
}
