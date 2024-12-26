import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(thickness: 2),
        ),
        SizedBox(width: 7),
        Text(
          "or".tr(context),
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.fontSize15(context),
          ),
        ),
        SizedBox(width: 7),
        Expanded(
          child: Divider(thickness: 2),
        ),
      ],
    );
  }
}
