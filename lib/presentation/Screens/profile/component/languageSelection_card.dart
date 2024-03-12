import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class LanguageSelection extends StatelessWidget {
  final VoidCallback onTap;
  final String language;
  final Color color;
  final Color textColor;
  const LanguageSelection({
    required this.onTap,
    required this.language,
    required this.color,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125.w / 2,
        height: 21.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppBorderRadius().borderRadius5,
        ),
        alignment: Alignment.center,
        child: Text(
          language,
          style: TextStyle(
            color: textColor,
            fontSize: AppFonts().fontSize12,
          ),
        ),
      ),
    );
  }
}
