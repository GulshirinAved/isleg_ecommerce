import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/config/routes/app_router.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('dataBox');
  Box dataBox = Hive.box('dataBox');
  await dataBox.clear();

  runApp(
    ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greyColor),
          fontFamily: 'TT Norms Pro Medium',
        ),
        routerConfig: AppRouter.router,
      ),
    ),
  );
}
