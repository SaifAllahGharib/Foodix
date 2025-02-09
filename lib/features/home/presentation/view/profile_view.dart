import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_state.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/change_language_widget.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_image_profile_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_profile_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/name_and_email.dart';
import 'package:yummy_home/features/your_addresses/view/your_addresses_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ImagePickerHelper _imagePickerHelper;
  File? _selectedImage;

  @override
  void initState() {
    _imagePickerHelper = ImagePickerHelper();
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0x77909090),
      backgroundColor: Colors.white,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeInBack,
      ),
      builder: (context) {
        return const ChangeLanguageWidget();
      },
    );
  }

  void _handelStates(state) {
    if (state is ProfilePickImage) {
      _selectedImage = state.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) => _handelStates(state),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.height30(context)),
              CustomImageProfileView(
                selectedImage: _selectedImage,
                pickImageFromCamera: () => context
                    .read<ProfileCubit>()
                    .pickImageFromCamera(_imagePickerHelper),
                pickImageFromGallery: () => context
                    .read<ProfileCubit>()
                    .pickImageFromGallery(_imagePickerHelper),
              ),
              SizedBox(height: Dimensions.height15(context)),
              const NameAndEmail(),
              SizedBox(height: Dimensions.height20(context)),
              Divider(
                color: AppColors.whiteGray,
                height: 1,
                thickness: Dimensions.height10(context),
              ),
              SizedBox(height: Dimensions.height45(context)),
              CustomItemProfileView(
                title: "addresses".tr(context),
                onClick: () => GoRouter.of(context).push(YourAddressesView.id),
              ),
              SizedBox(height: Dimensions.height30(context)),
              CustomItemProfileView(
                title: "language".tr(context),
                onClick: () => _showBottomSheet(context),
              ),
              SizedBox(height: Dimensions.height30(context)),
              CustomItemProfileView(
                title: "logout".tr(context),
                dividerIsShowing: false,
                onClick: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
