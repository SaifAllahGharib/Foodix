import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/features/your_addresses/view/widgets/list_view_addresses.dart';

class YourAddressesViewBody extends StatelessWidget {
  const YourAddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height10(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomBackButton(),
                  SizedBox(width: Dimensions.width30(context)),
                  Text(
                    "addresses".tr(context),
                    style: Styles.textStyle18(context)
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.radius20(context)),
                ),
                child: Text(
                  "add".tr(context),
                  style: Styles.textStyle15(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const ListViewAddresses(),
        ],
      ),
    );
  }
}
