import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_divider.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_button_language.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  void _changeLanguage(BuildContext context, String lang) async {
    await context.read<LocalCubit>().changeLanguage(lang);
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15(context)),
      child: SizedBox(
        height: Dimensions.height130(context) * 1.6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDivider(),
            SizedBox(height: Dimensions.height10(context)),
            Row(
              children: [
                CustomBackButton(),
                SizedBox(width: Dimensions.width30(context)),
                Text(
                  "language".tr(context),
                  style: Styles.textStyle18(context)
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20(context)),
            CustomButtonLanguage(
              text: "العربيه",
              onClick: () => _changeLanguage(context, "ar"),
            ),
            SizedBox(height: Dimensions.height20(context)),
            CustomButtonLanguage(
              text: "English",
              onClick: () => _changeLanguage(context, "en"),
            ),
          ],
        ),
      ),
    );
  }
}
