// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';

class PriceText extends StatelessWidget {
  final String leftName;
  final String price;
  final double fontSize;
  const PriceText({
    Key? key,
    required this.leftName,
    required this.price,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftName,
          style: TextStyle(color: AppColors.whiteColor, fontSize: fontSize),
        ),
        Text(
          price,
          style: TextStyle(color: AppColors.whiteColor, fontSize: fontSize),
        ),
      ],
    );
  }
}
