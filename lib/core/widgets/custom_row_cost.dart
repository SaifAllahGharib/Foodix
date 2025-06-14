import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/generated/l10n.dart';

class CustomRowCost extends StatelessWidget {
  final num egp;
  final FontWeight fontWeight;
  final Color color;
  final double? fontSize;
  final MainAxisAlignment mainAxisAlignment;

  const CustomRowCost({
    super.key,
    required this.egp,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.fontSize,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          "$egp",
          style: Styles.textStyle15(context).copyWith(
            fontWeight: fontWeight,
            color: color,
            fontSize: fontSize,
          ),
        ),
        SizedBox(width: Dimensions.width10),
        Text(
          S.of(context).foodCost,
          style: Styles.textStyle15(context).copyWith(
              fontWeight: FontWeight.w400, color: color, fontSize: fontSize),
        ),
      ],
    );
  }
}
