import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class ProductDesc extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final Color? color;
  const ProductDesc({
    required this.leftTitle,
    required this.rightTitle,
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftTitle,
            style: TextStyle(
              color: AppColors.darkBlueColor,
              fontSize: AppFonts().fontSize14.sp,
            ),
          ),
          Text(
            rightTitle,
            style: TextStyle(
              color: color == null
                  ? AppColors.darkBlueColor
                  : AppColors.darkOrangeColor,
              fontSize: AppFonts().fontSize14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
