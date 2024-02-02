import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class EmptyWarn extends StatelessWidget {
  final String topTitle;
  final String desc;
  final String icon;
  const EmptyWarn({
    required this.topTitle,
    required this.desc,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
            child: Text(
              topTitle,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: AppFonts().fontSize20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: AppFonts().fontSize14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
