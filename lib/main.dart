import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yummy_home/core/utils/app_router.dart';
import 'package:yummy_home/core/utils/colors.dart';
import 'package:yummy_home/core/utils/functions/init_app.dart';
import 'package:yummy_home/core/utils/functions/set_portrait_orientation.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/core/viewmodel/cubits/local_cubit.dart';
import 'package:yummy_home/core/widgets/loading.dart';
import 'package:yummy_home/features/home/data/repos/home/home_repo_imp.dart';
import 'package:yummy_home/features/home/data/repos/profile/profile_repo_imp.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/home/home_cubit.dart';
import 'package:yummy_home/features/home/presentation/viewmodel/cubits/profile/profile_cubit.dart';
import 'package:yummy_home/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPortraitOrientation();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Loading(),
            ),
          );
        }

        return MultiBlocProvider(
          providers: [
            BlocProvider<LocalCubit>(
              create: (context) => LocalCubit()..loadSavedLanguage(),
            ),
            BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(getIt.get<HomeRepositoryImp>()),
            ),
            BlocProvider<ProfileCubit>(
              create: (context) => ProfileCubit(
                getIt.get<ImagePickerHelper>(),
                getIt.get<ProfileRepositoryImp>(),
              ),
            ),
          ],
          child: BlocBuilder<LocalCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                locale: locale,
                routerConfig: AppRouter.router,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                theme: _buildAppTheme(locale),
              );
            },
          ),
        );
      },
    );
  }

  ThemeData _buildAppTheme(Locale? locale) {
    final String fontFamily =
        locale?.languageCode == 'ar' ? 'cairo' : 'poppins';

    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: fontFamily,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: AppColors.primaryColor,
        cursorColor: AppColors.primaryColor,
        selectionColor: AppColors.primaryColor,
      ),
    );
  }
}
