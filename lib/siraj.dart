import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/controllers/font/font_cubit.dart';
import 'package:siraj/core/controllers/internet_chicker/internet_connection_checker_cubit.dart';
import 'package:siraj/core/controllers/theme/theme_cubit.dart';
import 'package:siraj/core/services/storage/shared_preferences.dart';
import 'package:siraj/core/utils/router/app_router.dart';
import 'package:siraj/features/quran/controller/quran_cubit.dart';
import 'package:siraj/features/radio_sallah/presentation/cubit/sallah_and_radio_cubit.dart';

class Siraj extends StatelessWidget {
  const Siraj({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<FontCubit>(
            create: (context) => FontCubit(),
          ),
          BlocProvider<InternetConnectionCheckerCubit>(
            create: (context) =>
                InternetConnectionCheckerCubit()..checkInternetConnection(),
          ),
          BlocProvider<QuranCubit>(
            create: (context) => QuranCubit()
              ..loadSurah()
              ..testQuranJson(),
          ),
          BlocProvider<SallahAndRadioCubit>(
            create: (context) => SallahAndRadioCubit()
              ..getAllPreyTime()
              ..getPreyTimesAtCertinDay(),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<FontCubit>(
            create: (context) => FontCubit(),
          ),
        ],
        child: BlocBuilder<FontCubit, int>(
          builder: (context, state) {
            return BlocBuilder<ThemeCubit, int>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRouter.generateRoute,
                  theme: SharedPreferencesManager.getBool(key: "theme") == false
                      ? ThemeData()
                      : ThemeData(
                          brightness: Brightness.dark,
                        ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
