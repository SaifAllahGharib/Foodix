import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/restaurant/manager/cubits/restaurant/restaurant_cubit.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/restaurant_view_body.dart';

class RestaurantView extends StatelessWidget {
  static const String id = "/restaurant_view";

  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantCubit(),
      child: Scaffold(body: RestaurantViewBody()),
    );
  }
}
