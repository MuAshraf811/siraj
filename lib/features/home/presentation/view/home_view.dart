import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/features/qibla/controller/qibla_cubit.dart';
import 'package:siraj/features/qibla/presentation/view/qiblah_view.dart';
import 'package:siraj/features/settings/presentation/settings_view.dart';
import '../../../../core/controllers/nav_b_ar_cubit.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import 'home_page_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _views = [
    const HomePageView(),
    BlocProvider<QiblaCubit>(
      create: (context) => QiblaCubit()..gitLocation(),
      child: const QiblahView(),
    ),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBAr(),
      body: BlocBuilder<NavBArCubit, int>(
        builder: (context, state) => _views[state],
      ),
    );
  }
}
