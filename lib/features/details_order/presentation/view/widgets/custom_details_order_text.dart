import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/styles.dart';

class CustomDetailsOrderText extends StatelessWidget {
  final String text;
  final Color color;

  const CustomDetailsOrderText({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textStyle15(context).copyWith(
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
