import 'package:flutter/material.dart';

abstract class Dimensions {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Dynamic Height Padding and Margin
  static double height10(BuildContext context) {
    return getHeight(context) / 84.4;
  }

  static double height12(BuildContext context) {
    return getHeight(context) / 70;
  }

  static double height15(BuildContext context) {
    return getHeight(context) / 56.27;
  }

  static double height20(BuildContext context) {
    return getHeight(context) / 42.2;
  }

  static double height30(BuildContext context) {
    return getHeight(context) / 28.13;
  }

  static double height45(BuildContext context) {
    return getHeight(context) / 18.76;
  }

  static double height80(BuildContext context) {
    return getHeight(context) / 11.3;
  }

  static double height130(BuildContext context) {
    return getHeight(context) / 7;
  }

  // Dynamic width padding and margin
  static double width10(BuildContext context) {
    return getWidth(context) / 84.4;
  }

  static double width15(BuildContext context) {
    return getWidth(context) / 56.27;
  }

  static double width20(BuildContext context) {
    return getWidth(context) / 42.2;
  }

  static double width30(BuildContext context) {
    return getWidth(context) / 28.13;
  }

  static double width120(BuildContext context) {
    return getWidth(context) / 3.6;
  }

  // Dynamic font size
  static double fontSize12(BuildContext context) {
    return getHeight(context) / 65;
  }

  static double fontSize15(BuildContext context) {
    return getHeight(context) / 58.75;
  }

  static double fontSize20(BuildContext context) {
    return getHeight(context) / 42.2;
  }

  static double fontSize30(BuildContext context) {
    return getHeight(context) / 28.2;
  }

  // Dynamic radius
  static double radius10(BuildContext context) {
    return getHeight(context) / 77.6;
  }

  static double radius15(BuildContext context) {
    return getHeight(context) / 56.27;
  }

  static double radius20(BuildContext context) {
    return getHeight(context) / 42.2;
  }

  static double radius30(BuildContext context) {
    return getHeight(context) / 28.13;
  }

  // Dynamic icon size
  static double iconSize16(BuildContext context) {
    return getHeight(context) / 52.75;
  }

  static double iconSize20(BuildContext context) {
    return getHeight(context) / 42.2;
  }

  static double iconSize24(BuildContext context) {
    return getHeight(context) / 35.17;
  }

  static double iconSize45(BuildContext context) {
    return getHeight(context) / 21.17;
  }
}
