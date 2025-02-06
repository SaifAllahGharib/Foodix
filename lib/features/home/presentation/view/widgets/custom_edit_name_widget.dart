import 'package:flutter/material.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/dimensions.dart';
import 'package:yummy_home/core/widgets/custom_button.dart';
import 'package:yummy_home/core/widgets/custom_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15(context)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Dimensions.width30(context) * 2,
              height: Dimensions.height10(context) * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5000),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height30(context)),
          CustomTextField(
            hint: "edit_name".tr(context),
            onChanged: (val) {},
            controller: _editName,
          ),
          SizedBox(height: Dimensions.height20(context)),
          CustomButton(
            text: "edit".tr(context),
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
