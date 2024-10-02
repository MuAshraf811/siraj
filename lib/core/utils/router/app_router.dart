import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:siraj/core/controllers/nav_b_ar_cubit.dart';
import 'package:siraj/core/utils/constants/routes_path_constants.dart';
import 'package:siraj/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:siraj/features/hadith/presentation/view/hadith_view.dart';
import 'package:siraj/features/hadith/presentation/view/nawawy_view.dart';
import 'package:siraj/features/home/controller/home_cubit.dart';
import 'package:siraj/features/other/controller/cubit/zekrand_sebha_cubit.dart';
import 'package:siraj/features/other/controller/provider/sebha_provider.dart';
import 'package:siraj/features/other/presentation/view/asmaa_allah.dart';
import 'package:siraj/features/other/presentation/view/azkar_view.dart';
import 'package:siraj/features/other/presentation/view/doaa_view.dart';
import 'package:siraj/features/other/presentation/view/sebha_view.dart';
import 'package:siraj/features/radio_sallah/presentation/cubit/sallah_and_radio_cubit.dart';
import 'package:siraj/features/radio_sallah/presentation/view/prey_time_view.dart';
import 'package:siraj/features/radio_sallah/presentation/view/radio_view.dart';
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
      case RoutesConstants.doaaView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ZekrandSebhaCubit>(
            create: (context) => ZekrandSebhaCubit()..getDoaa(),
            child: const DoaaView(),
          ),
        );
      case RoutesConstants.asmaaAllahView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ZekrandSebhaCubit>(
            create: (context) => ZekrandSebhaCubit()..getAsmaaAllah(),
            child: const AsmaaAllahView(),
          ),
        );
      case RoutesConstants.azkarView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ZekrandSebhaCubit>(
            create: (context) => ZekrandSebhaCubit()..initAzkarjson(),
            child: const AzkarView(),
          ),
        );
      case RoutesConstants.preyTimesView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SallahAndRadioCubit>(
            create: (context) => SallahAndRadioCubit()..getAllPreyTime(),
            child: const PreyTimeView(),
          ),
        );
      case RoutesConstants.radioView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SallahAndRadioCubit>(
            create: (context) => SallahAndRadioCubit()..handleRadio(),
            child: const RadioView(),
          ),
        );
      case RoutesConstants.hadithView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HadithCubit>(
            create: (context) => HadithCubit()..getAllHAdithBooks(),
            child: const HadithView(),
          ),
        );
      case RoutesConstants.nawawyView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HadithCubit>(
            create: (context) => HadithCubit()..getNaway(),
            child: const NawawyView(),
          ),
        );

      case RoutesConstants.sebhaView:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<SebhaProvider>(
            create: (BuildContext context) => SebhaProvider(),
            child: const SebhaView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
    }
  }
}
