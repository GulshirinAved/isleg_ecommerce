import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class ProfileTile extends StatelessWidget {
  final int index;
  const ProfileTile({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius().borderRadius10,
        side: BorderSide(
          color: AppColors.lightGreyColor,
          width: 0.2,
        ),
      ),
      leading: SizedBox(
        width: 25,
        child: SvgPicture.asset(
          profileTiles[index]['icon'],
        ),
      ),
      title: Text(
        profileTiles[index]['title'],
        style: TextStyle(
          color: AppColors.greyColor,
          fontWeight: FontWeight.bold,
          fontSize: AppFonts().fontSize16,
        ),
      ),
    );
  }
}
