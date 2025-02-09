import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/models/user_model.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/widgets/custom_back_button.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text.dart';
import 'package:yummy_home/core/widgets/custom_text_button.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';
import 'package:yummy_home/features/signup/presentation/view/widgets/column_of_text_fields.dart';
import 'package:yummy_home/features/signup/presentation/viewmodel/cubits/signup/signup_cubit.dart';
import 'package:yummy_home/features/signup/presentation/viewmodel/cubits/signup/signup_state.dart';
import 'package:yummy_home/features/verification/presentation/view/verification_view.dart';

class SignupViewBody extends StatefulWidget {
  final String type;

  const SignupViewBody({super.key, required this.type});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _password;

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
      GoRouter.of(context).push(VerificationView.id);
      snackBar(context: context, text: state.msg, color: Colors.blue);
    } else if (state is SignupFailure) {
      snackBar(context: context, text: state.failure.errorMsg);
    }
  }

  void _signup(BuildContext context) async {
    context.read<SignupCubit>().signup(
          UserModel(
            name: _name.text,
            email: _email.text,
            phone: _phone.text,
            password: _password.text,
            type: widget.type,
          ),
          context,
        );
  }

  void _validation(BuildContext context) {
    context.read<SignupCubit>().validationFields(
          name: _name,
          email: _email,
          phone: _phone,
          password: _password,
          userType: widget.type,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        if (state is SignupLoading) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Dimensions.height20(context)),
                const CustomBackButton(),
                SizedBox(height: Dimensions.height30(context)),
                CustomText(text: "create_account".tr(context)),
                SizedBox(height: Dimensions.height45(context) * 1.3),
                ColumnOfTextFields(
                  context: context,
                  name: _name,
                  email: _email,
                  phone: _phone,
                  password: _password,
                  validator: (val) => _validation(context),
                ),
                SizedBox(height: Dimensions.height45(context)),
                CustomButton(
                  text: "signup".tr(context),
                  isEnabled: context.watch<SignupCubit>().buttonEnabled,
                  onClick: () async {
                    _signup(context);
                    // await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //   email: _email.text,
                    //   password: _password.text,
                    // );
                  },
                ),
                SizedBox(height: Dimensions.height45(context)),
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
