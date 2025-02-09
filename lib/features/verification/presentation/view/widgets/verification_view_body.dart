import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/services/firebase_service.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/functions/snack_bar.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/verification/presentation/viewmodel/cubits/verification/verification_cubit.dart';
import 'package:yummy_home/features/verification/presentation/viewmodel/cubits/verification/verification_state.dart';

class VerificationViewBody extends StatefulWidget {
  const VerificationViewBody({super.key});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  late final StreamController<bool> _verificationController;
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    _verificationController = StreamController.broadcast();
    _sendEmailVerification(context);
    _startVerificationListener();
    super.initState();
  }

  void _handelState(BuildContext context, state) async {
    if (state is VerificationIsEmailVerificationSend) {
      snackBar(
        context: context,
        text: "Send to email success",
        color: AppColors.primaryColor,
      );
    } else if (state is VerificationSuccess) {
      Future.delayed(const Duration(seconds: 8));
      GoRouter.of(context).go(HomeView.id);
    } else if (state is VerificationFailure) {
      snackBar(
        context: context,
        text: "Error: ",
      );
    }
  }

  void _sendEmailVerification(BuildContext context) {
    context.read<VerificationCubit>().sendEmailVerification();
  }

  void _startVerificationListener() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      final user = _firebaseService.auth.currentUser;
      await user?.reload();
      if (user != null && user.emailVerified) {
        context.read<VerificationCubit>().isEmailVerified();
        _verificationController.add(true);
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) => _handelState(context, state),
      builder: (context, state) {
        return StreamBuilder<bool>(
          stream: _verificationController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return Center(
                child: Icon(
                  Icons.check,
                  size: Dimensions.height130(context),
                  color: Colors.green,
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Dimensions.height20(context)),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height45(context) * 1.5),
                    // Image.asset(Assets.verify),
                    // const Spacer(),
                    CustomButton(
                      text: context.read<VerificationCubit>().time != 0
                          ? "${context.read<VerificationCubit>().time}s"
                          : "Resend email",
                      isEnabled: context.read<VerificationCubit>().canSend,
                      onClick: () => _sendEmailVerification(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
