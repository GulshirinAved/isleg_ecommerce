// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  final int number;
  const CustomAppbar({
    Key? key,
    required this.number,
  }) : super(key: key);

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
        number == 1
            ? iconSearch()
            : number == 2
                ? iconDelete()
                : const SizedBox(),
      ],
      centerTitle: true,
    );
  }

  Widget iconDelete() {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          IconlyBold.delete,
          color: AppColors.darkOrangeColor,
          size: 25.h,
        ),
      ),
    );
  }

  Widget iconSearch() {
    return Container(
      height: 38.w,
      width: 38.w,
      margin: const EdgeInsets.only(right: 6),
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
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.h);
}
