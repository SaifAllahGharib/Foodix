import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Localizations.localeOf(context).languageCode == "ar"
          ? Alignment.topRight
          : Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          GoRouter.of(context).go(SignupView.id);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: Dimensions.iconSize24(context),
        ),
      ),
    );
  }
}
