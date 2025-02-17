import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_cubit.dart';
import 'package:yummy_home/generated/l10n.dart';

class CustomEditNameWidget extends StatefulWidget {
  const CustomEditNameWidget({super.key});

  @override
  State<CustomEditNameWidget> createState() => _CustomEditNameWidgetState();
}

class _CustomEditNameWidgetState extends State<CustomEditNameWidget> {
  late final TextEditingController _editName;

  @override
  void initState() {
    _editName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _editName.dispose();
    super.dispose();
  }

  void _updateName(BuildContext context) {
    GoRouter.of(context).pop();
    context.read<ProfileCubit>().updateName(
          getIt.get<MySharedPreferences>().getIdUser()!,
          _editName.text,
        );
  }

  void _validation(BuildContext context) {
    context.read<ProfileCubit>().enableButton(_editName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Dimensions.width30 * 2,
              height: Dimensions.height10 * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5000),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height30),
          CustomTextField(
            hint: S.of(context).editName,
            onChanged: (val) => _validation(context),
            controller: _editName,
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: S.of(context).edit,
            isEnabled: context.watch<ProfileCubit>().isEnabled,
            onClick: () => _updateName(context),
          ),
        ],
      ),
    );
  }
}
