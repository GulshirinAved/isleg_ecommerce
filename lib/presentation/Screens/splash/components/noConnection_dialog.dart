import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isleg_ecommerce/app_localization.dart';
import 'package:isleg_ecommerce/blocs/internetConnection/bloc/internet_connection_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

Future<dynamic> showingDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (contextt) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius().borderRadius15,
        ),
        elevation: 1,
        backgroundColor: AppColors.transparentColor,
        child: Container(
          height: 168.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: AppBorderRadius().borderRadius15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                wifi,
                height: 50.h,
                width: 60.w,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  AppLocalization.of(context).getTransatedValues(
                        'noConnection1',
                      ) ??
                      '',
                  style: TextStyle(
                    fontSize: AppFonts().fontSize20.sp,
                    color: AppColors.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  AppLocalization.of(context).getTransatedValues(
                        'noConnection2',
                      ) ??
                      '',
                  style: TextStyle(
                    fontSize: AppFonts().fontSize14.sp,
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: AppBorderRadius().borderRadius10,
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    AppColors.darkOrangeColor,
                  ),
                ),
                onPressed: () {
                  context
                      .read<InternetConnectionBloc>()
                      .add(const InternetListenEvent());
                },
                child: Text(
                  AppLocalization.of(context).getTransatedValues(
                        'noConnection3',
                      ) ??
                      '',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppFonts().fontSize18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
