import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/add_food/presentation/view/widgets/custom_button_image_picker.dart';

class AddFoodViewBody extends StatefulWidget {
  const AddFoodViewBody({super.key});

  @override
  State<AddFoodViewBody> createState() => _AddFoodViewBodyState();
}

class _AddFoodViewBodyState extends State<AddFoodViewBody> {
  late final TextEditingController _foodName;
  late final TextEditingController _foodDesc;
  late final TextEditingController _foodCost;
  late final ImagePickerHelper _imagePickerHelper;
  File? _selectedImage;

  @override
  void initState() {
    _foodName = TextEditingController();
    _foodDesc = TextEditingController();
    _foodCost = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height45(context) * 1.5),
            CustomText(text: "add_food".tr(context)),
            SizedBox(height: Dimensions.height45(context)),
            CustomTextField(
              controller: _foodName,
              hint: "food_name".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomTextField(
              controller: _foodName,
              hint: "food_desc".tr(context),
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomTextField(
              controller: _foodName,
              hint: "food_cost".tr(context),
              textInputType: TextInputType.number,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10(context)),
            CustomButtonImagePicker(
              pickImageFromCamera: _pickImageFromCamera,
              pickImageFromGallery: _pickImageFromGallery,
              selectedImage: _selectedImage,
            ),
            SizedBox(height: Dimensions.height30(context)),
            CustomButton(
              text: "add".tr(context),
              isEnabled: true,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
