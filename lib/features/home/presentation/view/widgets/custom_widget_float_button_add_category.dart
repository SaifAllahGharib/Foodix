import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/main_seller/main_seller_cubit.dart';
import 'package:yummy_home/generated/l10n.dart';

class CustomWidgetFloatButtonAddCategory extends StatelessWidget {
  final TextEditingController categoryController;

  const CustomWidgetFloatButtonAddCategory({
    super.key,
    required this.categoryController,
  });

  void _validation(BuildContext context) {
    context.read<MainSellerCubit>().enableButton(categoryController);
  }

  void _addCategory(BuildContext context) {
    GoRouter.of(context).pop();
    context.read<MainSellerCubit>().addCategory(
          getIt.get<MySharedPreferences>().getIdUser()!,
          categoryController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20),
          topRight: Radius.circular(Dimensions.radius20),
        ),
      ),
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          CustomTextField(
            controller: categoryController,
            hint: S.of(context).category,
            onChanged: (val) => _validation(context),
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: S.of(context).add,
            isEnabled: context.watch<MainSellerCubit>().isEnabled,
            onClick: () => _addCategory(context),
          ),
        ],
      ),
    );
  }
}
