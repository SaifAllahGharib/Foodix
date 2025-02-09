import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 2),
        ),
        const SizedBox(width: 7),
        Text(
          "or".tr(context),
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.fontSize15(context),
          ),
        ),
        const SizedBox(width: 7),
        const Expanded(
          child: Divider(thickness: 2),
        ),
      ],
    );
  }
}
