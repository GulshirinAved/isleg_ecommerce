import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/app_localization.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

// ignore: must_be_immutable
class RadioButtn extends StatelessWidget {
  final String value;
  final String groupValue;
  final String title;
  VoidCallback onchanged;
  RadioButtn({
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onchanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      selectedTileColor: AppColors.darkOrangeColor,
      contentPadding: EdgeInsets.zero,
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.darkBlueColor,
      value: value,
      groupValue: groupValue,
      title: Text(
        AppLocalization.of(context).getTransatedValues(title) ?? '',
        style: TextStyle(
          color: AppColors.darkBlueColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      fillColor: MaterialStatePropertyAll(
        AppColors.darkOrangeColor,
      ),
      onChanged: (value) => onchanged.call(),
    );
  }
}
