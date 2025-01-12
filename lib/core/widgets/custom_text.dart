import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? textSize;

  const CustomText({
    super.key,
    required this.text,
    this.fontFamily,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        text,
        style: Styles.textStyle30(context).copyWith(
          fontFamily: fontFamily,
          fontSize: textSize,
        ),
      ),
    );
  }
}
