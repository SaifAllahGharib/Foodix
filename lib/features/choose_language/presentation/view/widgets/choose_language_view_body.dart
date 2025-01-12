import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/choose_type/presentation/view/choose_type_view.dart';

class ChooseLanguageViewBody extends StatelessWidget {
  const ChooseLanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        children: [
          SizedBox(height: Dimensions.height45(context) * 3),
          const CustomText(
            text: "اختار اللغه",
            fontFamily: "cairo",
          ),
          SizedBox(height: Dimensions.height45(context) * 7),
          CustomButton(
            text: "عربي",
            isEnabled: true,
            fontFamily: "cairo",
            onClick: () {
              _storeLanguageAndNavigate(context, "ar");
            },
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomButton(
            text: "English",
            isEnabled: true,
            fontFamily: "poppins",
            onClick: () {
              _storeLanguageAndNavigate(context, "en");
            },
          ),
        ],
      ),
    );
  }

  void _storeLanguageAndNavigate(BuildContext context, String lang) async {
    await context.read<LocalCubit>().changeLanguage(lang);
    GoRouter.of(context).go(ChooseTypeView.id);
  }
}
