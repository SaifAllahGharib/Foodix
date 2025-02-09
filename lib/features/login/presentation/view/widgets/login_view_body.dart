import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/choose_type/presentation/view/choose_type_view.dart';
import 'package:yummy_home/features/login/data/models/login_model.dart';
import 'package:yummy_home/features/login/presentation/view/forget_password_view.dart';
import 'package:yummy_home/features/login/presentation/viewmodel/cubits/login/login_cubit.dart';
import 'package:yummy_home/features/login/presentation/viewmodel/cubits/login/login_state.dart';
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

  void _onSuccess(user) {
    GoRouter.of(context).push(
      VerificationView.id,
      extra: {
        "user": user,
        "purpose": "login",
      },
    );
  }

  void _handelState(state) async {}

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
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height30(context)),
                CustomText(text: "welcome_back".tr(context)),
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
                CustomButton(
                  text: "login".tr(context),
                  isEnabled: context.watch<LoginCubit>().buttonEnabled,
                  onClick: () => _login(context),
                ),
                SizedBox(height: Dimensions.height20(context)),
                CustomTextButton(
                  text: "not_have_account".tr(context),
                  color: Colors.black,
                  onClick: () {
                    GoRouter.of(context).push(ChooseTypeView.id);
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
