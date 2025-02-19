import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/restaurant/presentation/view/widgets/restaurant_view_body.dart';
import 'package:yummy_home/features/restaurant/viewmodel/cubits/restaurant/restaurant_cubit.dart';

class RestaurantView extends StatelessWidget {
  static const String id = "/restaurant_view";
  final Map<dynamic, dynamic> extra;

  const RestaurantView({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantCubit(),
      child: Scaffold(body: RestaurantViewBody(extra: extra)),
    );
  }
}
