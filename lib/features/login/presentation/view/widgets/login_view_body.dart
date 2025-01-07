import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/data/models/login_model.dart';
import 'package:yummy_home/features/login/presentation/manager/cubits/login/login_cubit.dart';
import 'package:yummy_home/features/login/presentation/manager/cubits/login/login_state.dart';
import 'package:yummy_home/features/login/presentation/view/forget_password_view.dart';
import 'package:yummy_home/features/login/presentation/view/widgets/custom_back_button.dart';
import 'package:yummy_home/features/signup/presentation/manager/cubits/signup/signup_state.dart';
import 'package:yummy_home/features/signup/presentation/view/signup_view.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';
import 'package:yummy_home/features/verification/presentation/view/verification_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  void _onSuccess(user) async {
    await MySharedPreferences().storeUser(user);

    GoRouter.of(context).push(
      VerificationView.id,
      extra: user["email"],
    );
  }

  void _handelState(state) {
    if (state is LoginSuccess) {
      String msg = state.response.message;
      Map<String, dynamic> user = state.response.user!;

      if (msg == "Login successful") {
        snackBar(
          context: context,
          text: "login_successful".tr(context),
          color: AppColors.primaryColor,
        );

        GoRouter.of(context).go(HomeView.id);
      } else if (msg == "is not verified") {
        snackBar(
          context: context,
          text: "code_send_successfully".tr(context),
          color: AppColors.primaryColor,
        );

        _onSuccess(user);
      } else if (msg == "code not send successfully") {
        snackBar(
          context: context,
          text: "code_not_send_success".tr(context),
        );

        _onSuccess(user);
      } else if (msg == "Incorrect password") {
        snackBar(
          context: context,
          text: "password_incorrect".tr(context),
        );
      } else if (msg == "User not found") {
        snackBar(
          context: context,
          text: "this_user_does_not_exist".tr(context),
        );
      } else if (msg == "There was an error processing your request") {
        snackBar(
          context: context,
          text: "error_request".tr(context),
        );
      }
    } else if (state is SignupFailure) {
      snackBar(
        context: context,
        text: "Error: ${state.errorMsg}",
      );
    }
  }

  void _validation(BuildContext context) {
    context.read<LoginCubit>().validationFields(
          email: _email,
          password: _password,
        );
  }

  void _login(BuildContext context) {
    context.read<LoginCubit>().login(
          LoginModel(
            email: _email.text,
            password: _password.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        if (state is LoginLoading) {
          return Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height20(context)),
                CustomBackButton(
                  onPressed: () => GoRouter.of(context).go(SignupView.id),
                ),
                SizedBox(height: Dimensions.height30(context)),
                CustomText(text: "login".tr(context)),
                SizedBox(height: Dimensions.height45(context) * 2),
                CustomTextField(
                  controller: _email,
                  hint: "hint_email".tr(context),
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height15(context)),
                CustomTextField(
                  controller: _password,
                  isPassword: true,
                  hint: "hint_pass".tr(context),
                  onPressedShowPassword:
                      context.read<LoginCubit>().togglePasswordVisibility,
                  showPassword: context.watch<LoginCubit>().showPassword,
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height10(context)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    text: "forget_pass".tr(context),
                    onClick: () {
                      GoRouter.of(context).push(ForgetPasswordView.id);
                    },
                  ),
                ),
                SizedBox(height: Dimensions.height30(context)),
                CustomSignupButton(
                  text: "login".tr(context),
                  isEnabled: context.watch<LoginCubit>().buttonEnabled,
                  onClick: () => _login(context),
                ),
                SizedBox(height: Dimensions.height20(context)),
                CustomTextButton(
                  text: "not_have_account".tr(context),
                  color: Colors.black,
                  onClick: () {
                    GoRouter.of(context).go(SignupView.id);
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
