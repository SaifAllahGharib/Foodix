import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomImageItemSliverListViewBuyerView extends StatelessWidget {
  const CustomImageItemSliverListViewBuyerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.height130(context),
      height: Dimensions.height130(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.read<LocalCubit>().isDirectionRight
              ? 0
              : Dimensions.radius20(context)),
          bottomLeft: Radius.circular(
              context.read<LocalCubit>().isDirectionRight
                  ? 0
                  : Dimensions.radius20(context)),
          topRight: Radius.circular(context.read<LocalCubit>().isDirectionRight
              ? Dimensions.radius20(context)
              : 0),
          bottomRight: Radius.circular(
              context.read<LocalCubit>().isDirectionRight
                  ? Dimensions.radius20(context)
                  : 0),
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/person.jpg"),
        ),
      ),
    );
  }
}
