import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';

class ImageAndBackButton extends StatelessWidget {
  const ImageAndBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Dimensions.height130(context) * 2.4,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/person.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: const CustomBackButton(),
        ),
      ],
    );
  }
}
