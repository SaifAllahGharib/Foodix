import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/assets.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/widgets/custom_signup_button.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/data/models/signup_model.dart';
import 'package:yummy_home/features/signup/presentation/manager/cubits/signup/signup_cubit.dart';
import 'package:yummy_home/features/signup/presentation/manager/cubits/signup/signup_state.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/column_of_text_fields.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/custom_text.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/or_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _password;

  String? _userType;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();

    super.dispose();
  }

  void _handelState(state) {
    if (state is SignupSuccess) {
      String msg = state.response.message;

      if (msg == "User added successfully") {
        snackBar(
          context: context,
          text: "success".tr(context),
          color: AppColors.primaryColor,
        );
        GoRouter.of(context).go(HomeView.id);
      } else if (msg == "User already exists with this email") {
        snackBar(
          context: context,
          text: "user_already_exists".tr(context),
        );
      } else if (msg == "Failed to add user") {
        snackBar(
          context: context,
          text: "failed_to_create_account".tr(context),
        );
      } else if (msg.contains("Error:")) {
        snackBar(
          context: context,
          text: msg,
        );
      }
    } else if (state is SignupFailure) {
      snackBar(
        context: context,
        text: "Error: ${state.errorMsg}",
        color: Colors.red,
      );
    }
  }

  void _signup(BuildContext context) {
    context.read<SignupCubit>().signup(
          SignupModel(
            name: _name.text,
            email: _email.text,
            phone_number: _phone.text,
            password: _password.text,
            type: _userType.toString(),
          ),
        );
  }

  void _validation(BuildContext context) {
    context.read<SignupCubit>().validationFields(
          name: _name,
          email: _email,
          phone: _phone,
          password: _password,
          userType: _userType.toString(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        if (state is SignupLoading) {
          return Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height30(context)),
                CustomText(text: "create_account".tr(context)),
                SizedBox(height: Dimensions.height45(context) * 1.3),
                ColumnOfTextFields(
                  context: context,
                  name: _name,
                  email: _email,
                  phone: _phone,
                  password: _password,
                  userType: _userType,
                  validator: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height20(context)),
                CustomSignupButton(
                  text: "signup".tr(context),
                  isEnabled: context.watch<SignupCubit>().buttonEnabled,
                  onClick: () {
                    _signup(context);
                  },
                ),
                SizedBox(height: Dimensions.height20(context)),
                Or(),
                SizedBox(height: Dimensions.height20(context)),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.google,
                    width: Dimensions.iconSize45(context),
                  ),
                ),
                SizedBox(height: Dimensions.height15(context)),
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
}
