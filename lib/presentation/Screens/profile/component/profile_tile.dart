// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isleg_ecommerce/app_localization.dart';
import 'package:isleg_ecommerce/blocs/language/language_bloc.dart';

import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';
import 'package:isleg_ecommerce/presentation/Screens/profile/component/languageSelection_card.dart';

class ProfileTile extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final bool isLang;
  const ProfileTile({
    required this.index,
    required this.onTap,
    this.isLang = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
        AppLocalization.of(context)
                .getTransatedValues(profileTiles[index]['title']) ??
            '',
        style: TextStyle(
          color: AppColors.greyColor,
          fontWeight: FontWeight.bold,
          fontSize: AppFonts().fontSize16,
        ),
      ),
      trailing: isLang == true
          ? Container(
              width: 127.w,
              height: 21.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.greyColor),
                borderRadius: AppBorderRadius().borderRadius5,
              ),
              child: BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  String? locale;
                  if (state is ChangeLanguageState) {
                    locale = state.languageCode;
                  }
                  return Row(
                    children: [
                      LanguageSelection(
                        language: 'Türkmen',
                        color: locale == 'tr'
                            ? AppColors.darkOrangeColor
                            : AppColors.whiteColor,
                        textColor: locale == 'tr'
                            ? AppColors.whiteColor
                            : AppColors.greyColor,
                        onTap: () {
                          context
                              .read<LanguageBloc>()
                              .add(TurkmenLanguageEvent());
                        },
                      ),
                      LanguageSelection(
                        language: 'Русский',
                        color: locale == 'ru'
                            ? AppColors.darkOrangeColor
                            : AppColors.whiteColor,
                        textColor: locale == 'ru'
                            ? AppColors.whiteColor
                            : AppColors.greyColor,
                        onTap: () {
                          context
                              .read<LanguageBloc>()
                              .add(RussianLanguageEvent());
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
