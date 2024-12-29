import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/app_router.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/functions/set_portrait_orientation.dart';
import 'package:yummy_home/core/utils/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  setPortraitOrientation();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      builder: (context, child) {
        final locale = Localizations.localeOf(context);
        return Theme(
          data: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: _getFontFamily(locale),
            textSelectionTheme: TextSelectionThemeData(
              selectionHandleColor: AppColors.primaryColor,
              cursorColor: AppColors.primaryColor,
              selectionColor: AppColors.secColor,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  String _getFontFamily(Locale locale) {
    return locale.languageCode == 'ar' ? 'cairo' : 'poppins';
  }
}
