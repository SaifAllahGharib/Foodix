import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;

  const CustomBackButton({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.read<LocalCubit>().isDirectionRight
          ? Alignment.topRight
          : Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        enableFeedback: false,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: Dimensions.iconSize24(context),
          color: color,
        ),
      ),
    );
  }
}
