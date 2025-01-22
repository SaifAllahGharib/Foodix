import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';

class MiddleSectionDetailsOrderViewBody extends StatelessWidget {
  const MiddleSectionDetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on_outlined),
            SizedBox(width: Dimensions.width30(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "address".tr(context),
                  textSize: Dimensions.fontSize20(context) * 1.1,
                  alignment: context.read<LocalCubit>().isDirectionRight
                      ? Alignment.topRight
                      : Alignment.topLeft,
                ),
                SizedBox(height: Dimensions.height10(context) * 0.5),
                Text(
                  "Saif gharib",
                  style: Styles.textStyle15(context).copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height10(context) * 0.3),
                Text(
                  "Helwan elbalad3",
                  style: Styles.textStyle15(context).copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height10(context) * 0.3),
                Text(
                  "النصر عماره الحج نبوي بجوار بوابه الجيش",
                  style: Styles.textStyle15(context).copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height10(context) * 0.3),
                Row(
                  children: [
                    Text(
                      "phone number: ",
                      style: Styles.textStyle15(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "+201014890911",
                      style: Styles.textStyle15(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
