import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/data/models/change_password_model.dart';
import 'package:yummy_home/features/login/presentation/viewmodel/cubits/change_password/change_password_cubit.dart';
import 'package:yummy_home/features/login/presentation/viewmodel/cubits/change_password/change_password_state.dart';
import 'package:yummy_home/generated/l10n.dart';

class ChangePasswordViewBody extends StatefulWidget {
  final String verifyCode;
  final Map<String, dynamic> user;

  const ChangePasswordViewBody({
    super.key,
    required this.verifyCode,
    required this.user,
  });

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late final TextEditingController _changePassword;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _changePassword = TextEditingController();
    _confirmPassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _changePassword.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  void showPassword(BuildContext context) {
    context.read<ChangePasswordCubit>().togglePasswordVisibility();
  }

  bool isShow(BuildContext context) {
    return context.watch<ChangePasswordCubit>().showPassword;
  }

  void _validation(BuildContext context) {
    context.read<ChangePasswordCubit>().validationFields(
          changePassword: _changePassword,
          confirmPassword: _confirmPassword,
        );
  }

  void _handleState(state) async {
    if (state is ChangePasswordSuccess) {
      final msg = state.response.message;

      if (msg == "Password updated successfully") {
        snackBar(
          context: context,
          text: "change_password_successful",
          color: AppColors.primaryColor,
        );

        await MySharedPreferences().storeUser(state.response.user!);

        GoRouter.of(context).go(HomeView.id);
      } else if (msg == "Failed to update password") {
        snackBar(
          context: context,
          text: "change_password_failed",
        );
      }
    } else if (state is ChangePasswordFailure) {
      snackBar(
        context: context,
        text: "Error: ${state.errorMsg}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is ChangePasswordLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height45),
                CustomText(text: "change_password"),
                SizedBox(height: Dimensions.height45 * 2),
                CustomTextField(
                  controller: _changePassword,
                  isPassword: true,
                  hint: S.of(context).hintPass,
                  onPressedShowPassword: () => showPassword(context),
                  showPassword: isShow(context),
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height15),
                CustomTextField(
                  controller: _confirmPassword,
                  isPassword: true,
                  hint: "confirm_password",
                  onPressedShowPassword: () => showPassword(context),
                  showPassword: isShow(context),
                  onChanged: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: "verify",
                  isEnabled: context.watch<ChangePasswordCubit>().buttonEnabled,
                  onClick: () =>
                      context.read<ChangePasswordCubit>().changePassword(
                            ChangePasswordModel(
                              email: widget.user["email"],
                              password: _confirmPassword.text,
                              verifyCode: widget.verifyCode,
                            ),
                          ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
