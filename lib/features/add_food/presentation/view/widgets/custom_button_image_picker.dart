import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomButtonImagePicker extends StatelessWidget {
  final void Function() pickImageFromCamera;
  final void Function() pickImageFromGallery;
  final File? selectedImage;

  const CustomButtonImagePicker({
    super.key,
    required this.pickImageFromCamera,
    required this.pickImageFromGallery,
    required this.selectedImage,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.camera_alt_outlined),
                onPressed: pickImageFromCamera,
              ),
              SizedBox(width: Dimensions.width10(context)),
              IconButton(
                icon: Icon(Icons.image_outlined),
                onPressed: pickImageFromGallery,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
      child: selectedImage == null
          ? Container(
              width: double.infinity,
              height: Dimensions.height130(context),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.radius20(context)),
                border: Border.all(
                  width: 1,
                  color: AppColors.gray,
                ),
              ),
              child: Icon(
                Icons.add,
                size: Dimensions.height45(context),
                color: AppColors.gray,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
              child: Image.file(
                selectedImage!,
                width: Dimensions.height130(context) * 1.7,
                height: Dimensions.height130(context) * 1.7,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
