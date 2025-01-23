import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/change_language_widget.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_item_profile_view.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/name_and_email.dart';
import 'package:yummy_home/features/your_addresses/view/your_addresses_view.dart';

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
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/person.jpg",
                  width: Dimensions.height130(context) * 1.2,
                  height: Dimensions.height130(context) * 1.2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height15(context)),
          NameAndEmail(),
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
            onClick: () {
              showModalBottomSheet(
                context: context,
                barrierColor: Color(0x77909090),
                backgroundColor: Colors.white,
                sheetAnimationStyle: AnimationStyle(
                  curve: Curves.fastOutSlowIn,
                  reverseCurve: Curves.easeInBack,
                ),
                builder: (context) {
                  return ChangeLanguageWidget();
                },
              );
            },
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
  }
}
