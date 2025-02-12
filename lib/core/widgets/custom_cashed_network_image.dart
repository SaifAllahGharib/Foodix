import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/custom_placeholder.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  final String? imageURL;
  final double width;
  final double height;

  const CustomCashedNetworkImage({
    super.key,
    this.imageURL,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL ?? "",
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) =>
          const CustomPlaceholder(image: Assets.placeholder),
      errorWidget: (context, url, error) =>
          const CustomPlaceholder(image: Assets.placeholder),
    );
  }
}
