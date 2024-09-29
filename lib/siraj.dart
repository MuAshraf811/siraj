import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/controllers/theme/theme_cubit.dart';
import 'package:siraj/core/utils/router/app_router.dart';
import 'package:siraj/features/quran/controller/quran_cubit.dart';

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
          BlocProvider<QuranCubit>(
            create: (context) => QuranCubit()..loadSurah(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          theme: ThemeData(),
        ),
      ),
    );
  }
}
