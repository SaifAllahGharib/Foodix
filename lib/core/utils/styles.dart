import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

abstract class Styles {
  static TextStyle textStyle15(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize15(context),
    );
  }

  static TextStyle textStyle18(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize18(context),
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize20(context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle30(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize30(context),
      fontWeight: FontWeight.w600,
    );
  }
}
