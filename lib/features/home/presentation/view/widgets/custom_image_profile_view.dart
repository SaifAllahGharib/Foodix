import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/widgets/custom_item_pick_image.dart';

class CustomImageProfileView extends StatefulWidget {
  const CustomImageProfileView({super.key});

  @override
  State<CustomImageProfileView> createState() => _CustomImageProfileViewState();
}

class _CustomImageProfileViewState extends State<CustomImageProfileView> {
  late final ImagePickerHelper _imagePickerHelper;
  File? _selectedImage;

  @override
  void initState() {
    _imagePickerHelper = ImagePickerHelper();
    super.initState();
  }

  Future<void> _pickImageFromCamera() async {
    File? pickedImage = await _imagePickerHelper.pickImageFromCamera();
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    File? pickedImage = await _imagePickerHelper.pickImageFromGallery();
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomItemPickImage(
          pickImageFromCamera: _pickImageFromCamera,
          pickImageFromGallery: _pickImageFromGallery,
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
          child: Image.asset(
            "assets/images/person.jpg",
            width: Dimensions.height130(context) * 1.2,
            height: Dimensions.height130(context) * 1.2,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
