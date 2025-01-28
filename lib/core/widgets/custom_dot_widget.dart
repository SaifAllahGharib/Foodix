import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomDotWidget extends StatelessWidget {
  const CustomDotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: Dimensions.height10(context) * 0.6,
      color: Colors.black54,
    );
  }
}
