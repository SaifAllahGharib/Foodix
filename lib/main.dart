import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:yummy_home/core/manager/cubits/local_cubit.dart';
import 'package:yummy_home/core/utils/app_localizations.dart';
import 'package:yummy_home/core/utils/app_router.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/functions/set_portrait_orientation.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  setPortraitOrientation();
  await MySharedPreferences().init();

  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => MyApp(),
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalCubit()..loadSavedLanguage(),
      child: BlocBuilder<LocalCubit, Locale>(
        builder: (context, locale) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
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
                locale: locale,
                theme: _buildAppTheme(locale),
              );
            },
          );
        },
      ),
    );
  }

  ThemeData _buildAppTheme(Locale? locale) {
    final String fontFamily =
        locale?.languageCode == 'ar' ? 'cairo' : 'poppins';

    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: fontFamily,
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: AppColors.primaryColor,
        cursorColor: AppColors.primaryColor,
        selectionColor: AppColors.secColor,
      ),
    );
  }
}
