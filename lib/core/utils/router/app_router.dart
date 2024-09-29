import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/core/controllers/nav_b_ar_cubit.dart';
import 'package:siraj/core/utils/constants/routes_path_constants.dart';
import 'package:siraj/features/home/controller/home_cubit.dart';

import '../../../features/home/presentation/view/home_view.dart';
import '../../../features/quran/presentation/view/surahs_view.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.homePage:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<NavBArCubit>(
                create: (context) => NavBArCubit(),
              ),
              BlocProvider<HomeCubit>(
                create: (context) => HomeCubit()
                  ..generateCustomAllahName()
                  ..generateCustomDoaa()
                  ..generateCustomZekr(),
              ),
            ],
            child: const HomeView(),
          ),
        );
      case RoutesConstants.surahsView:
        return MaterialPageRoute(
          builder: (context) => const SurahsView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
    }
  }
}
