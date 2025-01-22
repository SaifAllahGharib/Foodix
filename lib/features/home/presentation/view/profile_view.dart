import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Dimensions.height30(context)),
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(Dimensions.radius20(context) * 20),
              child: Image.asset(
                "assets/images/person.jpg",
                width: Dimensions.height130(context) * 1.2,
                height: Dimensions.height130(context) * 1.2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: Dimensions.height15(context)),
          CustomText(
            text: "Saif Gharib",
            textSize: Dimensions.height20(context) * 1.2,
          ),
          SizedBox(height: Dimensions.height20(context)),
          Divider(
            color: AppColors.whiteGray,
            height: 1,
            thickness: Dimensions.height10(context),
          ),
          SizedBox(height: Dimensions.height45(context)),
          CustomItemProfileView(
            title: "Personal information",
            onClick: () {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomItemProfileView(
            title: "Addresses",
            onClick: () {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomItemProfileView(
            title: "Change password",
            onClick: () {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomItemProfileView(
            title: "Language",
            onClick: () {},
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomItemProfileView(
            title: "Logout",
            dividerIsShowing: false,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
