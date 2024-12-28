import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';
import 'package:yummy_home/features/signup/presentation/manager/cubits/signup/cubit.dart';
import 'package:yummy_home/features/signup/presentation/manager/cubits/signup/state.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/or_widget.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/user_type.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _userType;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => handelState(state),
      builder: (context, state) {
        if (state is SignupLoading) {
          return Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height45(context)),
                CustomText(text: "create_account".tr(context)),
                SizedBox(height: Dimensions.height45(context) * 2),
                CustomTextField(
                  controller: _name,
                  hint: "hint_name".tr(context),
                  onChanged: (val) {
                    context.read<SignupCubit>().validationFields(
                          name: _name,
                          email: _email,
                          phone: _phone,
                          password: _password,
                          userType: _userType!,
                        );
                  },
                ),
                SizedBox(height: Dimensions.height15(context)),
                CustomTextField(
                  controller: _email,
                  hint: "hint_email".tr(context),
                  onChanged: (val) {
                    context.read<SignupCubit>().validationFields(
                          name: _name,
                          email: _email,
                          phone: _phone,
                          password: _password,
                          userType: _userType!,
                        );
                  },
                ),
                SizedBox(height: Dimensions.height15(context)),
                CustomTextField(
                  controller: _phone,
                  hint: "hint_phone".tr(context),
                  onChanged: (val) {
                    context.read<SignupCubit>().validationFields(
                          name: _name,
                          email: _email,
                          phone: _phone,
                          password: _password,
                          userType: _userType!,
                        );
                  },
                ),
                SizedBox(height: Dimensions.height15(context)),
                UserType(
                  type: _userType,
                  onChange: (val) {
                    _userType = val;
                    context.read<SignupCubit>().validationFields(
                          name: _name,
                          email: _email,
                          phone: _phone,
                          password: _password,
                          userType: _userType!,
                        );
                  },
                ),
                SizedBox(height: Dimensions.height15(context)),
                CustomTextField(
                  controller: _password,
                  isPassword: true,
                  hint: "hint_pass".tr(context),
                  onPressedShowPassword:
                      context.read<SignupCubit>().togglePasswordVisibility,
                  showPassword: context.watch<SignupCubit>().showPassword,
                  onChanged: (val) {
                    context.read<SignupCubit>().validationFields(
                          name: _name,
                          email: _email,
                          phone: _phone,
                          password: _password,
                          userType: _userType!,
                        );
                  },
                ),
                SizedBox(height: Dimensions.height30(context)),
                CustomSignupButton(
                  text: "signup".tr(context),
                  isEnabled: context.watch<SignupCubit>().buttonEnabled,
                  onClick: () {
                    context.read<SignupCubit>().signup(
                          SignupModel(
                            name: _name.text,
                            email: _email.text,
                            phone_number: _phone.text,
                            password: _password.text,
                            type: _userType!,
                          ),
                        );
                  },
                ),
                SizedBox(height: Dimensions.height30(context)),
                Or(),
                SizedBox(height: Dimensions.height20(context)),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.google,
                    width: Dimensions.iconSize45(context),
                  ),
                ),
                SizedBox(height: Dimensions.height20(context)),
                CustomTextButton(
                  text: "already_have_account".tr(context),
                  onClick: () {
                    GoRouter.of(context).push(LoginView.id);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void handelState(state) {
    if (state is SignupSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.response.message)),
      );
    } else if (state is SignupFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${state.errorMsg}")),
      );
    }
  }
}
