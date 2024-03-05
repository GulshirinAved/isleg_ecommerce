import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/home/banner/banner_bloc.dart';
import 'package:isleg_ecommerce/blocs/home/banner_indicator/banner_indicator_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final BannerBloc _bannerBloc = BannerBloc();
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_bannerBloc.state is BannerLoaded) {
        final bannerLoadedState = _bannerBloc.state as BannerLoaded;
        final bannerList = bannerLoadedState.bannerList;
        if (_pageController.page == bannerList.length - 1) {
          _pageController.jumpToPage(0);
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void initState() {
    _bannerBloc.add(GetBannerList());
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController.dispose();
    _bannerBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _bannerBloc,
        ),
        BlocProvider(
          create: (context) => BannerIndicatorBloc(),
        ),
      ],
      child: BlocBuilder<BannerBloc, BannerState>(
        builder: (context, state) {
          if (state is BannerError) {
            return Center(
              child: Text(state.error!),
            );
          } else if (state is BannerInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BannerLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BannerLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: state.bannerList.length,
                      onPageChanged: (value) {
                        context
                            .read<BannerIndicatorBloc>()
                            .add(PressEvent(eventIndex: value));
                      },
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl:
                              'http://$host/${state.bannerList[index].image}',
                          fit: BoxFit.cover,
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
                        children: List.generate(
                          state.bannerList.length,
                          (index) => BlocBuilder<BannerIndicatorBloc,
                              BannerIndicatorState>(
                            builder: (context, stateIndicator) {
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
                                    backgroundColor:
                                        stateIndicator.stateIndex == index
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
            );
          } else {
            return Container(
              color: Colors.amber,
            );
          }
        },
      ),
    );
  }
}
