import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomImageFood extends StatelessWidget {
  final String imageUrl;

  const CustomImageFood({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions.height130(context) * 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
