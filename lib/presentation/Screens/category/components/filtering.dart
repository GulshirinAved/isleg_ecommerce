import 'package:flutter/material.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class Filtering extends StatelessWidget {
  const Filtering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'Filter',
            style: TextStyle(
              color: AppColors.darkBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: AppFonts().fontSize13,
            ),
          ),
        ),
        Icon(
          Icons.filter_alt_rounded,
          size: 23,
          color: AppColors.darkOrangeColor,
        ),
      ],
    );
  }
}
