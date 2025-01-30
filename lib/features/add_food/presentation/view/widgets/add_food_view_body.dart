import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/add_food/presentation/manager/cubits/add_food/add_food_cubit.dart';
import 'package:yummy_home/features/add_food/presentation/manager/cubits/add_food/add_food_state.dart';
import 'package:yummy_home/features/add_food/presentation/view/widgets/custom_button_image_picker.dart';

class AddFoodViewBody extends StatefulWidget {
  const AddFoodViewBody({super.key});

  @override
  State<AddFoodViewBody> createState() => _AddFoodViewBodyState();
}

class _AddFoodViewBodyState extends State<AddFoodViewBody> {
  late final TextEditingController _foodName;
  late final TextEditingController _foodDesc;
  late final TextEditingController _foodPrice;
  late final ImagePickerHelper _imagePickerHelper;
  File? _selectedImage;

  @override
  void initState() {
    _foodName = TextEditingController();
    _foodDesc = TextEditingController();
    _foodPrice = TextEditingController();
    _imagePickerHelper = ImagePickerHelper();
    super.initState();
  }

  void validate(BuildContext context) {
    context.read<AddFoodCubit>().validation(
          name: _foodName,
          desc: _foodDesc,
          price: _foodPrice,
          image: _selectedImage,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFoodCubit(),
      child: BlocConsumer<AddFoodCubit, AddFoodState>(
        listener: (context, state) {
          if (state is AddFoodPickImage) {
            _selectedImage = state.image;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(Dimensions.height20(context)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height20(context)),
                  CustomBackButton(),
                  SizedBox(height: Dimensions.height45(context)),
                  CustomText(text: "add_food".tr(context)),
                  SizedBox(height: Dimensions.height45(context)),
                  CustomButtonImagePicker(
                    pickImageFromCamera: () {
                      context
                          .read<AddFoodCubit>()
                          .pickImageFromCamera(_imagePickerHelper);
                    },
                    pickImageFromGallery: () {
                      context
                          .read<AddFoodCubit>()
                          .pickImageFromGallery(_imagePickerHelper);
                    },
                    selectedImage: _selectedImage,
                  ),
                  SizedBox(height: Dimensions.height10(context)),
                  CustomTextField(
                    controller: _foodName,
                    hint: "food_name".tr(context),
                    onChanged: (val) => validate(context),
                  ),
                  SizedBox(height: Dimensions.height10(context)),
                  CustomTextField(
                    controller: _foodDesc,
                    hint: "food_desc".tr(context),
                    onChanged: (val) => validate(context),
                  ),
                  SizedBox(height: Dimensions.height10(context)),
                  CustomTextField(
                    controller: _foodPrice,
                    hint: "food_cost".tr(context),
                    textInputType: TextInputType.number,
                    onChanged: (val) => validate(context),
                  ),
                  SizedBox(height: Dimensions.height30(context)),
                  CustomButton(
                    text: "add".tr(context),
                    isEnabled: context.watch<AddFoodCubit>().isValid,
                    onClick: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
