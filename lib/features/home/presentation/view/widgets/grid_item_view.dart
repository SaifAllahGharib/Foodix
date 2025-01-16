import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class GridItemView extends StatelessWidget {
  const GridItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Dimensions.height130(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
            image: DecorationImage(
              image: AssetImage("assets/images/choose_type.jpeg"),
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
            "ملوخيه",
            style: Styles.textStyle18(context).copyWith(fontFamily: "cairo"),
          ),
        ),
      ],
    );
  }
}
