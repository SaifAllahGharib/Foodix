import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/home/presentation/view/main_seller_view.dart';
import 'package:yummy_home/features/home/presentation/view/orders_view.dart';
import 'package:yummy_home/features/home/presentation/view/profile_view.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/orders/orders_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_cubit.dart';

class HomeViewBody extends StatelessWidget {
  final int selectedIndex;

  const HomeViewBody({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        MainSellerView(),
        // MainBuyerView(),
        BlocProvider(
          create: (context) => OrdersCubit(),
          child: OrdersView(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
          child: ProfileView(),
        ),
      ],
    );
  }
}
