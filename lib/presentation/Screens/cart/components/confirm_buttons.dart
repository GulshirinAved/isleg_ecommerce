import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class ConfirmButtons extends StatelessWidget {
  const ConfirmButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
            Size(MediaQuery.of(context).size.width, 45)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: AppBorderRadius().borderRadius30,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColors.darkOrangeColor),
      ),
      onPressed: () {},
      child: Text(
        'Tassyklamak',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: AppFonts().fontSize20.sp,
        ),
      ),
    );
  }
}
