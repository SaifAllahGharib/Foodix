import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/features/home/presentation/view/widgets/custom_edit_name_widget.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0x77909090),
      backgroundColor: Colors.white,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeInBack,
      ),
      builder: (context) {
        return const CustomEditNameWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Saif Gharib",
                textSize: Dimensions.height20 * 1.2,
                alignment: context.watch<LocalCubit>().isArabic
                    ? Alignment.topRight
                    : Alignment.topLeft,
              ),
              Text(
                "saifgharib28@gmail.com",
                style: Styles.textStyle15(context)
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          IconButton(
            onPressed: () => _showBottomSheet(context),
            icon: const Icon(
              Icons.edit,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
