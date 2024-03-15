import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 40.w),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          isDense: true,
          prefixIcon: Icon(
            IconlyLight.search,
            size: 18.h,
          ),
          prefixIconColor: AppColors.darkOrangeColor,
          suffixIcon: Icon(
            Icons.close,
            size: 18.h,
          ),
          suffixIconColor: AppColors.orangeColor,
          hintText: 'Gözleg...',
          hintStyle: TextStyle(
            fontSize: AppFonts().fontSize16,
            color: AppColors.greyBlueColor,
          ),
          filled: true,
          fillColor: AppColors.whiteColor,
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius().borderRadius30,
            borderSide: BorderSide(
              color: AppColors.darkGreyColor,
              width: 0.3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius().borderRadius30,
            borderSide: BorderSide(
              color: AppColors.darkGreyColor,
              width: 0.3,
            ),
          ),
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius().borderRadius30,
            borderSide: BorderSide(
              color: AppColors.darkGreyColor,
              width: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
