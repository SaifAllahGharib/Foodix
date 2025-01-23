import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Saif Gharib",
                textSize: Dimensions.height20(context) * 1.2,
                alignment: context.read<LocalCubit>().isDirectionRight
                    ? Alignment.topRight
                    : Alignment.topLeft,
              ),
              Text(
                "saifgharib28@gmail.com",
                style: Styles.textStyle15(context)
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
