import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isleg_ecommerce/config/routes/app_router.dart';

void main() {
  runApp(
    ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          fontFamily: 'TT Norms Pro Medium',
        ),
        routerConfig: router,
      ),
    ),
  );
}
