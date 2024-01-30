import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/blocs/home/banner_indicator/banner_indicator_bloc.dart';
import 'package:isleg_ecommerce/config/constants/constants.dart';

import 'package:isleg_ecommerce/presentation/CustomWidgets/custom_appbar.dart';
import 'package:isleg_ecommerce/presentation/Screens/home/components/banner.dart';
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
