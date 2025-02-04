import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_row_cost.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_image_food.dart';

class GridItemView extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final String foodCost;
  final void Function() onClick;

  const GridItemView({
    super.key,
    required this.foodName,
    required this.imageUrl,
    required this.foodCost,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageFood(imageUrl: imageUrl),
            SizedBox(height: Dimensions.height10(context)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10(context) * 0.5,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: context.read<LocalCubit>().isDirectionRight
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      foodName,
                      style: Styles.textStyle18(context),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10(context) * 0.7),
                  Align(
                    alignment: context.read<LocalCubit>().isDirectionRight
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: CustomRowCost(
                      egp: foodCost,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
