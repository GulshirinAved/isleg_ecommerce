import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

Container cartIcons(IconData icon, bool isMinus) {
  return Container(
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
  );
}
