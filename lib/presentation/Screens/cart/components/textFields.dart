import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

// ignore: must_be_immutable
class TextFields extends StatelessWidget {
  Widget prefixIcon;
  String hintText;
  bool? isNumber;
  bool? isAdress;
  bool? isObscure;
  VoidCallback? onTap;

  TextFields({
    required this.prefixIcon,
    required this.hintText,
    this.isNumber = false,
    this.isAdress = false,
    this.isObscure,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor.withOpacity(0.5),
        borderRadius: AppBorderRadius().borderRadius10,
        border: Border.all(color: AppColors.greyColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 29.5.w,
            margin: EdgeInsets.only(left: 17.w, bottom: 9.h),
            height: 16.w,
            child: prefixIcon,
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: isAdress == false
                ? TextField(
                    obscureText: isObscure == true ? true : false,
                    cursorColor: AppColors.darkOrangeColor,
                    keyboardType: isNumber == true
                        ? TextInputType.number
                        : TextInputType.text,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppFonts().fontSize18.sp,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.transparentColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.transparentColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.transparentColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.transparentColor,
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 12.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hintText,
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppFonts().fontSize18.sp,
                      ),
                    ),
                  ),
          ),
          isAdress == true
              ? Icon(
                  IconlyLight.arrowDown2,
                  color: AppColors.greyColor,
                )
              : isObscure == null
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: onTap,
                      child: isObscure == true
                          ? Icon(
                              CupertinoIcons.eye_slash,
                              color: AppColors.greyColor,
                            )
                          : Icon(
                              CupertinoIcons.eye_fill,
                              color: AppColors.darkOrangeColor,
                            ),
                    ),
        ],
      ),
    );
  }
}
