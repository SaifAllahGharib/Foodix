import 'package:flutter/material.dart';
import 'package:yummy_home/core/widgets/custom_image.dart';

class CustomPlaceholder extends StatelessWidget {
  final String image;

  const CustomPlaceholder({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CustomImage(image: image);
  }
}
