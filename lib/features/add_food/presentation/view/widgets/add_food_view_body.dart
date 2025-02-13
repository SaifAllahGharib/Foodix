import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/add_food/presentation/view/widgets/custom_button_image_picker.dart';
import 'package:yummy_home/features/add_food/presentation/viewmodel/cubits/add_food/add_food_cubit.dart';
import 'package:yummy_home/features/add_food/presentation/viewmodel/cubits/add_food/add_food_state.dart';
import 'package:yummy_home/generated/l10n.dart';

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

  @override
  void dispose() {
    _foodName.dispose();
    _foodDesc.dispose();
    _foodPrice.dispose();
    super.dispose();
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
    return BlocConsumer<AddFoodCubit, AddFoodState>(
      listener: (context, state) {
        if (state is AddFoodPickImage) {
          _selectedImage = state.image;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height20),
                const CustomBackButton(),
                SizedBox(height: Dimensions.height45),
                CustomText(text: S.of(context).addFood),
                SizedBox(height: Dimensions.height45),
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
                SizedBox(height: Dimensions.height10),
                CustomTextField(
                  controller: _foodName,
                  hint: S.of(context).foodName,
                  onChanged: (val) => validate(context),
                ),
                SizedBox(height: Dimensions.height10),
                CustomTextField(
                  controller: _foodDesc,
                  hint: S.of(context).foodDesc,
                  onChanged: (val) => validate(context),
                ),
                SizedBox(height: Dimensions.height10),
                CustomTextField(
                  controller: _foodPrice,
                  hint: S.of(context).foodCost,
                  textInputType: TextInputType.number,
                  onChanged: (val) => validate(context),
                ),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: S.of(context).add,
                  isEnabled: context.watch<AddFoodCubit>().isValid,
                  onClick: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
