import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/dimensions.dart';

class UserType extends StatefulWidget {
  final String? type;
  final void Function(String? val) onChange;

  const UserType({
    super.key,
    required this.type,
    required this.onChange,
  });

  @override
  State<StatefulWidget> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  final List<String> userTypes = ["vendor", "buyer"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: Text(
          "type".tr(context),
          style: TextStyle(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius10(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20(context)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
      ),
      value: widget.type,
      items: userTypes.map((type) {
        return DropdownMenuItem(
          value: type.tr(context),
          child: Text(type.tr(context)),
        );
      }).toList(),
      onChanged: widget.onChange,
    );
  }
}
