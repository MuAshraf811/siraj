import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/home/presentation/widgets/home_grid.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/prayer_times_part.dart';
import '../widgets/random_allah_name_container.dart';
import '../widgets/random_doaa_container.dart';
import '../widgets/random_zekr_container.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            const SliverToBoxAdapter(
              child: VerticalSpacer(height: 16),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: const PrayerTimesContainer(),
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpacer(height: 4),
            ),
            const SliverToBoxAdapter(child: CustomGrid()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const RandomDoaaContainer(),
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpacer(height: 12),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const RandomAllahNameContainer(),
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpacer(height: 12),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const RandomZekrContainer(),
              ),
            ),
            const SliverToBoxAdapter(
              child: VerticalSpacer(height: 14),
            ),
          ],
        ),
      ),
    );
  }
}
