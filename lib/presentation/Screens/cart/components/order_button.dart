import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.darkOrangeColor,
          borderRadius: AppBorderRadius().borderRadius30,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'Sargyt etmek',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppFonts().fontSize18.sp,
                ),
              ),
            ),
            Icon(
              IconlyLight.arrowRightCircle,
              color: AppColors.whiteColor,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
