// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';

class SignButton extends StatelessWidget {
  final String orangeTitle;
  final VoidCallback orangeOnTap;
  final String title;
  final VoidCallback titleTap;
  const SignButton({
    required this.orangeTitle,
    required this.orangeOnTap,
    required this.title,
    required this.titleTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: titleTap,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: AppFonts().fontSize20,
            ),
          ),
        ),
        MaterialButton(
          onPressed: orangeOnTap,
          color: AppColors.darkOrangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius().borderRadius30,
          ),
          child: Text(
            orangeTitle,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppFonts().fontSize20,
            ),
          ),
        ),
      ],
    );
  }
}
