import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onPressed;

  const CustomBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.read<LocalCubit>().isDirectionRight
          ? Alignment.topRight
          : Alignment.topLeft,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: Dimensions.iconSize24(context),
        ),
      ),
    );
  }
}
