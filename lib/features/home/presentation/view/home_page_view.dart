import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_colors.dart';
import 'package:siraj/core/utils/constants/utils_constants.dart';
import 'package:siraj/features/home/presentation/widgets/home_grid.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../radio_sallah/presentation/cubit/sallah_and_radio_cubit.dart';
import '../widgets/custom_app_bar.dart';
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
            const CustomPreyTimesSection(),
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

class CustomPreyTimesSection extends StatelessWidget {
  const CustomPreyTimesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 14.w),
        child: SizedBox(
          height: 64.h,
          child: BlocBuilder<SallahAndRadioCubit, SallahAndRadioState>(
            buildWhen: (previous, current) =>
                current is GettingPreyTimeAtSigleDaySuccessState ||
                current is GettingPreyTimeAtSigleDayErrorState ||
                current is GettingPreyTimeAtSigleDayState,
            builder: (context, state) {
              if (state is GettingPreyTimeAtSigleDaySuccessState) {
                return ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: 62.w,
                    height: 60.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                    margin: EdgeInsets.only(right: 6.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.95),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      border: Border.all(color: AppColors.white),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          preyNames[index],
                          style: getSemiBoldStyle(
                              fontSize: 14, color: AppColors.white),
                        ),
                        Text(
                          context
                              .read<SallahAndRadioCubit>()
                              .preyTimeAtSingelDay[index]
                              .replaceAll(" (EEST)", ""),
                          style: getSemiBoldStyle(
                              fontSize: 14, color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 62.w,
                  height: 60.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  margin: EdgeInsets.only(right: 6.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.95),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    border: Border.all(color: AppColors.white),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        preyNames[index],
                        style: getSemiBoldStyle(
                            fontSize: 14, color: AppColors.white),
                      ),
                      Shimmer.fromColors(
                        highlightColor: AppColors.white,
                        baseColor: AppColors.white.withOpacity(0.75),
                        child: Container(
                          width: 56.w,
                          height: 12.h,
                          color: AppColors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
