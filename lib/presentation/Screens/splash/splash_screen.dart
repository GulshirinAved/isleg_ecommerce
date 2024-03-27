import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:isleg_ecommerce/app_localization.dart';
import 'package:isleg_ecommerce/blocs/internetConnection/bloc/internet_connection_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double _containerOpacity = 0.0;
  int _containerSize = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.forward();
    _showAnimation();
  }

//animation
  void _showAnimation() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InternetConnectionBloc()..add(InternetNotConnectedEvent()),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: BlocListener<InternetConnectionBloc, InternetConnectionState>(
          listener: (context, state) {
            if (state is InternetConnectedState) {
              context.pushReplacementNamed('home');
            } else {
              _showDialog(context);
            }
          },
          child: BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
            builder: (context, state) {
              if (state is InternetConnectionInitial) {
                context
                    .read<InternetConnectionBloc>()
                    .add(const InternetNotConnectedEvent());
              }
              return Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastOutSlowIn,
                  opacity: _containerOpacity,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.fastOutSlowIn,
                    height: MediaQuery.of(context).size.height / _containerSize,
                    width: MediaQuery.of(context).size.width / _containerSize,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      logoImages,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius().borderRadius15,
          ),
          elevation: 1,
          backgroundColor: AppColors.transparentColor,
          child: Container(
            height: 150.h,
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
                        fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
