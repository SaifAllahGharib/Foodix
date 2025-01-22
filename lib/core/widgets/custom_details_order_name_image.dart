import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/details_order/presentation/view/widgets/custom_details_order_text.dart';

class CustomDetailsOrderNameImage extends StatelessWidget {
  final bool customTextDetails;

  const CustomDetailsOrderNameImage({
    super.key,
    this.customTextDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
          child: Image.asset(
            "assets/images/choose_type.jpeg",
            width: 100,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Saif gharib",
              textSize: Dimensions.fontSize20(context) * 1.1,
              alignment: context.read<LocalCubit>().isDirectionRight
                  ? Alignment.topRight
                  : Alignment.topLeft,
            ),
            customTextDetails
                ? SizedBox(height: Dimensions.height10(context) * 0.2)
                : SizedBox.shrink(),
            customTextDetails
                ? CustomDetailsOrderText(text: "completed".tr(context))
                : SizedBox.shrink(),
            SizedBox(height: Dimensions.height10(context) * 0.2),
            Row(
              children: [
                CustomDetailsOrderText(
                  text: "order_number".tr(context),
                  color: Colors.grey,
                ),
                CustomDetailsOrderText(
                  text: "1921866646",
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
