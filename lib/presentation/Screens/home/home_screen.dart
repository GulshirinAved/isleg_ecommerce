import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';

import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        children: [CategoryCardScrolling(), ImageSlider()],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {},
            itemCount: sliderImages.length,
            itemBuilder: (context, index) {
              return Image.asset(
                sliderImages[index],
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
              children: List<Widget>.generate(
                  sliderImages.length,
                  (index) => GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5.w),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.amber,
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
