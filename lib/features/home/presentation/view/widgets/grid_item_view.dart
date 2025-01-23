import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class GridItemView extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final void Function() onClick;

  const GridItemView({
    super.key,
    required this.foodName,
    required this.imageUrl,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: Dimensions.height130(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10(context)),
          Align(
            alignment: context.read<LocalCubit>().isDirectionRight
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              foodName,
              style: Styles.textStyle18(context).copyWith(fontFamily: "cairo"),
            ),
          ),
        ],
      ),
    );
  }
}
