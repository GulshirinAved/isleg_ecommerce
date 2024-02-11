import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Icon(
            IconlyLight.activity,
            color: AppColors.darkOrangeColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontSize: AppFonts().fontSize18,
          ),
        ),
      ],
    );
  }
}
