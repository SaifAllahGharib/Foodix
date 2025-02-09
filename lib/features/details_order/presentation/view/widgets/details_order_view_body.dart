import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/bottom_section_details_order_view_body.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/middle_section_details_order_view_body.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/top_section_details_order_view_body.dart';

class DetailsOrderViewBody extends StatelessWidget {
  const DetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height20(context)),
          const CustomBackButton(),
          SizedBox(height: Dimensions.height15(context)),
          const TopSectionDetailsOrderViewBody(),
          SizedBox(height: Dimensions.height20(context)),
          const Divider(color: AppColors.gray, height: 1),
          SizedBox(height: Dimensions.height20(context)),
          const MiddleSectionDetailsOrderViewBody(),
          SizedBox(height: Dimensions.height20(context)),
          const Divider(color: AppColors.gray, height: 1),
          SizedBox(height: Dimensions.height20(context)),
          CustomText(
            text: "your_order".tr(context),
            textSize: Dimensions.fontSize20(context) * 1.1,
            alignment: context.read<LocalCubit>().isDirectionRight
                ? Alignment.topRight
                : Alignment.topLeft,
          ),
          SizedBox(height: Dimensions.height10(context)),
          const BottomSectionDetailsOrderViewBody(),
        ],
      ),
    );
  }
}
