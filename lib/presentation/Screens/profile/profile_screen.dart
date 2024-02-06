import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(number: 3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PersonData(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ListTile(
                tileColor: AppColors.greyBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: AppBorderRadius().borderRadius10,
                ),
                leading: Icon(
                  IconlyBold.profile,
                  color: AppColors.darkOrangeColor,
                ),
                title: Text(
                  'Ulanyjy',
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFonts().fontSize18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
