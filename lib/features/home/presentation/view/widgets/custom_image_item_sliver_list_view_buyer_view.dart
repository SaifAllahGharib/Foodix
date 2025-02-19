import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';

class CustomImageItemSliverListViewBuyerView extends StatefulWidget {
  const CustomImageItemSliverListViewBuyerView({super.key});

  @override
  State<CustomImageItemSliverListViewBuyerView> createState() =>
      _CustomImageItemSliverListViewBuyerViewState();
}

class _CustomImageItemSliverListViewBuyerViewState
    extends State<CustomImageItemSliverListViewBuyerView> {
  bool get isArabic => context.watch<LocalCubit>().isArabic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.height130,
      height: Dimensions.height130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isArabic ? 0 : Dimensions.radius20),
          bottomLeft: Radius.circular(isArabic ? 0 : Dimensions.radius20),
          topRight: Radius.circular(isArabic ? Dimensions.radius20 : 0),
          bottomRight: Radius.circular(isArabic ? Dimensions.radius20 : 0),
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.food),
        ),
      ),
    );
  }
}
