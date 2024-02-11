import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class Sorting extends StatelessWidget {
  const Sorting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openAnimatedDialog(context);
      },
      child: sortTitle(),
    );
  }

  void _openAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetAnimationCurve: Curves.slowMiddle,
          insetAnimationDuration: const Duration(microseconds: 400),
          child: Container(
            height: 150.h,
            width: 150.w,
            color: AppColors.whiteColor,
            child: Row(
              children: [
                sortTitle(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.clear_circled,
                    color: AppColors.darkOrangeColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row sortTitle() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: SvgPicture.asset(sort),
        ),
        Text(
          'Tertipleme',
          style: TextStyle(
            color: AppColors.darkBlueColor,
            fontWeight: FontWeight.bold,
            fontSize: AppFonts().fontSize13,
          ),
        ),
      ],
    );
  }
}
