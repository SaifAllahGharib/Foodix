import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/bottom_section_details_order_view_body.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/middle_section_details_order_view_body.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/top_section_details_order_view_body.dart';
import 'package:yummy_home/generated/l10n.dart';

class DetailsOrderViewBody extends StatelessWidget {
  const DetailsOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimensions.height20),
          const CustomBackButton(),
          SizedBox(height: Dimensions.height15),
          const TopSectionDetailsOrderViewBody(),
          SizedBox(height: Dimensions.height20),
          const Divider(color: AppColors.gray, height: 1),
          SizedBox(height: Dimensions.height20),
          const MiddleSectionDetailsOrderViewBody(),
          SizedBox(height: Dimensions.height20),
          const Divider(color: AppColors.gray, height: 1),
          SizedBox(height: Dimensions.height20),
          CustomText(
            text: S.of(context).yourOrder,
            textSize: Dimensions.fontSize20 * 1.1,
            alignment: context.watch<LocalCubit>().isArabic
                ? Alignment.topRight
                : Alignment.topLeft,
          ),
          SizedBox(height: Dimensions.height10),
          const BottomSectionDetailsOrderViewBody(),
        ],
      ),
    );
  }
}
