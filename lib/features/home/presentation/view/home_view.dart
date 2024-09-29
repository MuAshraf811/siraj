import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/controllers/nav_b_ar_cubit.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import 'home_page_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _views = [
    const HomePageView(),
    const HomePageView(),
    const HomePageView(),
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
