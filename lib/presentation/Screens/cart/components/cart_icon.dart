// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';

class CartIcons extends StatelessWidget {
  final IconData icon;
  final bool isMinus;
  final VoidCallback onTap;
  const CartIcons({
    required this.icon,
    required this.isMinus,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 23.h,
        width: 23.h,
        padding: const EdgeInsets.all(1),
        margin: isMinus == true
            ? const EdgeInsets.only(left: 5)
            : const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
