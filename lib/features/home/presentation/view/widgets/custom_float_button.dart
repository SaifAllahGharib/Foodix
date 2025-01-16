import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomFloatButton extends StatelessWidget {
  final void Function() onClick;

  const CustomFloatButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.read<LocalCubit>().isDirectionRight
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5000),
        ),
        padding: EdgeInsets.all(Dimensions.width10(context)),
        child: IconButton(
          onPressed: onClick,
          icon: Icon(
            Icons.add,
            size: Dimensions.getWidth(context) * 0.070,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
