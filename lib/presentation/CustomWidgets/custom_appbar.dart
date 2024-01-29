import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 2,
      title: SvgPicture.asset(
        logoImages,
        height: 50.h,
        fit: BoxFit.cover,
      ),
      actions: [
        Container(
          height: 40.w,
          width: 40.w,
          margin: EdgeInsets.only(right: 3),
          decoration: BoxDecoration(
            color: AppColors.orangeColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              search,
              height: 22.w,
            ),
          ),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.h);
}
