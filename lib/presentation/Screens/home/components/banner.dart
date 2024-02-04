import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/home/banner_indicator/banner_indicator_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == 2) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerIndicatorBloc(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: BlocBuilder<BannerIndicatorBloc, BannerIndicatorState>(
                builder: (context, state) {
                  return PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      context
                          .read<BannerIndicatorBloc>()
                          .add(PressEvent(eventIndex: value));
                    },
                    itemCount: sliderImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        sliderImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    sliderImages.length,
                    (index) =>
                        BlocBuilder<BannerIndicatorBloc, BannerIndicatorState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                            context
                                .read<BannerIndicatorBloc>()
                                .add(PressEvent(eventIndex: index));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            margin: EdgeInsets.only(right: 5.w),
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: state.stateIndex == index
                                  ? AppColors.darkOrangeColor
                                  : AppColors.lightGreyColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
