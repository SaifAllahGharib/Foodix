import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/features/verification/presentation/view/widgets/verification_view_body.dart';
import 'package:yummy_home/features/verification/presentation/viewmodel/cubits/verification/verification_cubit.dart';

class VerificationView extends StatelessWidget {
  static const String id = "/verification_view";
  final Map<String, dynamic> user;
  final String purpose;

  const VerificationView({
    super.key,
    required this.user,
    required this.purpose,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: Scaffold(
        body: VerificationViewBody(user: user, purpose: purpose),
      ),
    );
  }
}
