import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class TopTitle extends StatelessWidget {
  final String title;
  const TopTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(right: 10.w, left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.darkBlueColor,
              fontSize: AppFonts().fontSize20.sp,
            ),
          ),
          SvgPicture.asset(
            arrowRight,
            height: 23.h,
          ),
        ],
      ),
    );
  }
}
