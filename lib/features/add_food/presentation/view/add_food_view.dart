import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/add_food/presentation/manager/cubits/add_food/add_food_cubit.dart';
import 'package:yummy_home/features/add_food/presentation/view/widgets/add_food_view_body.dart';

class AddFoodView extends StatelessWidget {
  static const String id = "/add_food";

  const AddFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFoodCubit(),
      child: Scaffold(
        body: AddFoodViewBody(),
      ),
    );
  }
}
