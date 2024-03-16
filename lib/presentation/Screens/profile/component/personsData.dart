import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';

import 'package:isleg_ecommerce/config/theme/theme.dart';

class PersonData extends StatelessWidget {
  const PersonData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 4,
          ),
          ClipOval(
            child: Image.asset(
              personImage,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            'Hanow Kemal',
            style: TextStyle(
              color: AppColors.darkBlueColor,
              fontSize: AppFonts().fontSize16.sp,
            ),
          ),
          Text(
            '+99361899737',
            style: TextStyle(
              color: AppColors.darkBlueColor,
              fontSize: AppFonts().fontSize13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
