import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/styles.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/presentation/view/change_password_view.dart';
import 'package:yummy_home/features/verification/data/models/verify_code_model.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_cubit.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_state.dart';
import 'package:yummy_home/features/verification/presentation/view/widgets/verify_text_form_fields.dart';

class VerificationViewBody extends StatefulWidget {
  final Map<String, dynamic> user;
  final String purpose;

  const VerificationViewBody({
    super.key,
    required this.user,
    required this.purpose,
  });

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  String myCode = "";

  @override
  void initState() {
    startTimer(context);

    super.initState();
  }

  void _handelState(BuildContext context, state) async {
    if (state is VerificationSuccess) {
      String msg = state.response.message;

      if (msg == "Verification successful") {
        snackBar(
          context: context,
          text: "verify_success".tr(context),
          color: AppColors.primaryColor,
        );

        if (widget.purpose == "signup" || widget.purpose == "login") {
          myCode = "";

          await MySharedPreferences().storeUser(widget.user);

          GoRouter.of(context).go(HomeView.id);
        } else {
          GoRouter.of(context).go(
            ChangePasswordView.id,
            extra: {
              "code": myCode,
              "user": widget.user,
            },
          );

          myCode = "";
        }
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
    } else if (state is VerificationReSendCode) {
      final msg = state.response.message;

      if (msg == "Verification code sent successfully") {
        snackBar(
          context: context,
          text: "code_send_successfully".tr(context),
          color: AppColors.primaryColor,
        );
      } else if (msg == "Failed to update verification code" ||
          msg == "Failed to send email") {
        snackBar(
          context: context,
          text: "code_not_send_success".tr(context),
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

  void startTimer(BuildContext context) {
    context.read<VerificationCubit>().startTimer();
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
                      widget.user["email"],
                      style: Styles.textStyle15(context).copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
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
                    state is VerificationTimerUpdated
                        ? state.canSend
                            ? CustomTextButton(
                                text: "click_to_resend".tr(context),
                                onClick: () {
                                  context
                                      .read<VerificationCubit>()
                                      .reSendCode(widget.user["email"]);
                                },
                                color: AppColors.primaryColor,
                              )
                            : Text(
                                "  ${state.time}s",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                        : SizedBox.shrink(),
                  ],
                ),
                SizedBox(height: Dimensions.height45(context)),
                CustomSignupButton(
                  text: "verify".tr(context),
                  isEnabled: true,
                  onClick: () {
                    _verify(context, widget.user["email"], myCode);
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
