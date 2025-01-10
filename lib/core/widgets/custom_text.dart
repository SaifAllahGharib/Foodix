import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        text,
        style: Styles.textStyle30(context),
      ),
    );
  }
}
