import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onPressed;

  const CustomBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Localizations.localeOf(context).languageCode == "ar"
          ? Alignment.topRight
          : Alignment.topLeft,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: Dimensions.iconSize24(context),
        ),
      ),
    );
  }
}
