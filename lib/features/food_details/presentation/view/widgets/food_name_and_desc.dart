import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';

class FoodNameAndDesc extends StatelessWidget {
  const FoodNameAndDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Birger King",
            alignment: context.read<LocalCubit>().isDirectionRight
                ? Alignment.topLeft
                : Alignment.topLeft,
            textSize: Dimensions.height20(context) * 1.1,
          ),
          SizedBox(height: Dimensions.height10(context) * 0.5),
          Text(
            "meet 150g, red sos, halebeno, tomatom",
            style: Styles.textStyle15(context).copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
