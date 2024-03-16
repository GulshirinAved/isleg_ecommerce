import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isleg_ecommerce/app_localization.dart';
import 'package:isleg_ecommerce/blocs/language/language_bloc.dart';
import 'package:isleg_ecommerce/config/routes/app_router.dart';
import 'package:isleg_ecommerce/config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('dataBox');
  await Hive.openBox('headerBox');
  await Hive.openBox('lang');
  await Hive.openBox('categoryProductBox');
  final Box dataBox = Hive.box('dataBox');
  final Box headerBox = Hive.box('headerBox');
  await dataBox.clear();
  await headerBox.clear();

  runApp(
    BlocProvider(
      create: (context) => LanguageBloc()..add(InitialLanguageEvent()),
      child: ScreenUtilInit(
        builder: (context, child) => BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            String? locale;
            if (state is ChangeLanguageState) {
              locale = state.languageCode;
            }
            return MaterialApp.router(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: AppColors.greyColor),
                fontFamily: 'TT Norms Pro Medium',
              ),
              locale: Locale(locale ?? 'tr'),
              supportedLocales: const [
                Locale('ru'),
                Locale('tr'),
              ],
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null) {
                    if (deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                }
                return supportedLocales.first;
              },
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    ),
  );
}
