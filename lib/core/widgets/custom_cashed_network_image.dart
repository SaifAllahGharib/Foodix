import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/custom_placeholder.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  final String? imageURL;
  final String placeholder;
  final double? width;
  final double? height;

  const CustomCashedNetworkImage({
    super.key,
    this.imageURL,
    this.width,
    this.height,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL ?? placeholder,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => CustomPlaceholder(image: placeholder),
      errorWidget: (context, url, error) =>
          CustomPlaceholder(image: placeholder),
    );
  }
}
