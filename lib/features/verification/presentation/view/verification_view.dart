import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/features/verification/data/repos/verificatoin_repo_imp.dart';
import 'package:yummy_home/features/verification/presentation/manager/cubits/verification/verification_cubit.dart';
import 'package:yummy_home/features/verification/presentation/view/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  static const String id = "/verification_view";

  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VerificationCubit(getIt.get<VerificationRepositoryImp>()),
      child: Scaffold(body: VerificationViewBody()),
    );
  }
}
