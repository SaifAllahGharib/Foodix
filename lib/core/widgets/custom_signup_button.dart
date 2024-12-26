import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class CustomSignupButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final bool isEnabled;

  const CustomSignupButton({
    super.key,
    required this.text,
    required this.onClick,
    this.isEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled
          ? onClick
          : () async {
              // var response = await Api(Dio()).post(
              //   endPoint: "register.php",
              //   data: {
              //     "name": "Mohamed",
              //     "email": "m2@g.com",
              //     "phone_number": "11111111111",
              //     "password": "123456",
              //     "type": "saller",
              //   },
              // );
              //
              // print("RESPONSE: $response");
            },
      height: Dimensions.height45(context),
      enableFeedback: isEnabled ? true : false,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width120(context),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimensions.radius10(context),
        ),
      ),
      textColor: Colors.white,
      color: isEnabled ? AppColors.primaryColor : AppColors.secColor,
      child: Text(
        text,
        style: TextStyle(fontSize: Dimensions.fontSize15(context)),
      ),
    );
  }
}
