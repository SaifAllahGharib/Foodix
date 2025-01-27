import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomRowCost extends StatelessWidget {
  final String egp;
  final FontWeight fontWeight;
  final Color color;
  final double? fontSize;

  const CustomRowCost({
    super.key,
    required this.egp,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          egp,
          style: Styles.textStyle15(context).copyWith(
            fontWeight: fontWeight,
            color: color,
            fontSize: fontSize,
          ),
        ),
        SizedBox(width: Dimensions.width10(context)),
        Text(
          "food_cost".tr(context),
          style: Styles.textStyle15(context).copyWith(
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}
