import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_item_pick_image.dart';

class CustomImageProfileView extends StatelessWidget {
  final void Function() pickImageFromCamera;
  final void Function() pickImageFromGallery;
  final File? selectedImage;

  const CustomImageProfileView({
    super.key,
    required this.pickImageFromCamera,
    required this.pickImageFromGallery,
    required this.selectedImage,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomItemPickImage(
          pickImageFromCamera: pickImageFromCamera,
          pickImageFromGallery: pickImageFromGallery,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radius20(context) * 20),
        child: GestureDetector(
          onTap: () => _showBottomSheet(context),
          child: selectedImage == null
              ? Image.asset(
                  "assets/images/person.jpg",
                  width: Dimensions.height130(context) * 1.2,
                  height: Dimensions.height130(context) * 1.2,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  selectedImage!,
                  width: Dimensions.height130(context) * 1.2,
                  height: Dimensions.height130(context) * 1.2,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
