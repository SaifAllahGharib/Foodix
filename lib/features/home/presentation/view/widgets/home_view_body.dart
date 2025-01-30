import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/home/presentation/manager/cubits/profile/profile_cubit.dart';
import 'package:yummy_home/features/home/presentation/view/main_buyer_view.dart';
import 'package:yummy_home/features/home/presentation/view/order_view.dart';
import 'package:yummy_home/features/home/presentation/view/profile_view.dart';

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
        // MainSellerView(),
        MainBuyerView(),
        OrderView(),
        BlocProvider(
          create: (context) => ProfileCubit(),
          child: ProfileView(),
        ),
      ],
    );
  }
}
