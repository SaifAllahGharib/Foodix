import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/verification/data/models/verify_code_model.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_cubit.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_state.dart';
import 'package:yummy_home/features/verification/presentation/view/widgets/verify_text_form_fields.dart';

class VerificationViewBody extends StatefulWidget {
  final String email;

  const VerificationViewBody({super.key, required this.email});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  String myCode = "";

  void _handelState(BuildContext context, state) {
    if (state is VerificationSuccess) {
      String msg = state.response.message;

      if (msg == "Verification successful") {
        snackBar(
          context: context,
          text: "success".tr(context),
          color: AppColors.primaryColor,
        );

        GoRouter.of(context).go(HomeView.id);
      } else if (msg == "Invalid verification code or email") {
        snackBar(
          context: context,
          text: "invalid_verification_code".tr(context),
        );
      } else if (msg == "There was an error processing your request") {
        snackBar(
          context: context,
          text: "error_request".tr(context),
        );
      }
    } else if (state is VerificationFailure) {
      snackBar(
        context: context,
        text: "Error: ${state.errorMsg}",
      );
    }
  }

  void _verify(BuildContext context, String email, String code) {
    context.read<VerificationCubit>().verifyCode(
          VerifyCodeModel(
            email: email,
            code: code,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) => _handelState(context, state),
      builder: (context, state) {
        if (state is VerificationLoading) {
          return Loading();
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height20(context)),
            child: Column(
              children: [
                SizedBox(height: Dimensions.height45(context) * 1.5),
                Text(
                  "enter_verification_code".tr(context),
                  style: Styles.textStyle20(context).copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: Dimensions.height10(context)),
                Wrap(
                  children: [
                    Text(
                      "we_have_send_code_to".tr(context),
                      style: Styles.textStyle15(context).copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    SizedBox(width: Dimensions.width15(context)),
                    Text(
                      widget.email,
                      style: Styles.textStyle15(context).copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height45(context) * 2.5),
                VerifyTextFormFields(
                  verifyCode: (code) {
                    myCode = code;
                  },
                ),
                SizedBox(height: Dimensions.height10(context) * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "didn't_get_a_code".tr(context),
                      style: Styles.textStyle15(context).copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    CustomTextButton(
                      text: "click_to_resend".tr(context),
                      onClick: () {},
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height45(context)),
                CustomSignupButton(
                  text: "verify".tr(context),
                  isEnabled: true,
                  onClick: () {
                    _verify(context, widget.email, myCode);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
