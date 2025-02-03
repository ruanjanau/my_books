import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';
import 'package:my_books/src/core/navigation/navigation.dart';

import '../core/core.dart';

class MyBookApp extends StatelessWidget {
  const MyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      child: GetMaterialApp(
        navigatorKey: Grock.navigationKey,
        initialRoute: Routes.splash,
        initialBinding: NavigationBinding(),
        getPages: AppRoutes.routes,
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
              textScaler: const TextScaler.linear(1),
            ),
            child: child!,
          );
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'AdoptPet',
      ),
    );
  }
}
