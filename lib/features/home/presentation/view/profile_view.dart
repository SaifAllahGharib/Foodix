import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/change_language_widget.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_image_profile_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_profile_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/name_and_email.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_state.dart';
import 'package:yummy_home/features/your_addresses/view/your_addresses_view.dart';
import 'package:yummy_home/generated/l10n.dart';

class ProfileView extends StatefulWidget {
  final UserModel user;

  const ProfileView({super.key, required this.user});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _storage = getIt.get<MySharedPreferences>();

  File? _selectedImage;

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

  void _pickImageFromCamera(BuildContext context) {
    context.read<ProfileCubit>().pickImageFromCamera();
  }

  void _pickImageFromGallery(BuildContext context) {
    context.read<ProfileCubit>().pickImageFromGallery();
  }

  void _signOut(BuildContext context) {
    context.read<ProfileCubit>().signOut();
    context.read<HomeCubit>().resetState();
  }

  void _signOutSuccess() {
    getIt.get<MySharedPreferences>().clearAllData();
    snackBar(
      context: context,
      text: S.of(context).success,
      color: AppColors.primaryColor,
    );
    GoRouter.of(context).go("/");
  }

  void _updateNameSuccess(state) {
    snackBar(
      context: context,
      text: S.of(context).success,
      color: AppColors.primaryColor,
    );
    getIt.get<MySharedPreferences>().storeString(
          "name",
          state.newName,
        );
  }

  void _handelStates(state) {
    if (state is ProfilePickImageState) {
      _selectedImage = state.image;
    } else if (state is ProfileSignOutState) {
      _signOutSuccess();
    } else if (state is ProfileUpdateNameState) {
      _updateNameSuccess(state);
    } else if (state is ProfileFailureState) {
      snackBar(context: context, text: state.errorMsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) => _handelStates(state),
      builder: (context, state) {
        if (state is ProfileLoadingState) return const Loading();

        return Column(
          children: [
            SizedBox(height: Dimensions.height30),
            CustomImageProfileView(
              imageURL: "_selectedImage",
              pickImageFromCamera: () => _pickImageFromCamera(context),
              pickImageFromGallery: () => _pickImageFromGallery(context),
            ),
            SizedBox(height: Dimensions.height15),
            NameAndEmail(
              name: _storage.getNameUser() == null
                  ? widget.user.name ?? ""
                  : _storage.getNameUser()!,
              email: _storage.getEmailUser() == null
                  ? widget.user.name ?? ""
                  : _storage.getEmailUser()!,
            ),
            SizedBox(height: Dimensions.height20),
            Divider(
              color: AppColors.whiteGray,
              height: 1,
              thickness: Dimensions.height10,
            ),
            SizedBox(height: Dimensions.height45),
            CustomItemProfileView(
              title: S.of(context).addresses,
              onClick: () => GoRouter.of(context).push(YourAddressesView.id),
            ),
            SizedBox(height: Dimensions.height30),
            CustomItemProfileView(
              title: S.of(context).language,
              onClick: () => _showBottomSheet(context),
            ),
            SizedBox(height: Dimensions.height30),
            CustomItemProfileView(
              title: S.of(context).logout,
              dividerIsShowing: false,
              onClick: () => _signOut(context),
            ),
          ],
        );
      },
    );
  }
}
