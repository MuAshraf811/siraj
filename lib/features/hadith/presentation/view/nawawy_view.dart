import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/controllers/font/font_cubit.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';
import 'package:siraj/features/hadith/presentation/cubit/hadith_cubit.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../other/presentation/widgets/hadith_shimmer.dart';

class NawawyView extends StatelessWidget {
  const NawawyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18.w,
                        color: AppColors.secondry,
                      )),
                ),
              ),
              const VerticalSpacer(height: 16),
              BlocBuilder<HadithCubit, HadithState>(
                buildWhen: (previous, current) =>
                    current is NawawyLoadedState ||
                    current is NawawyLoadingState,
                builder: (context, state) {
                  debugPrint(state.toString());
                  if (state is NawawyLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: AppColors.black,
                          height: 16.h,
                          thickness: 1.5.h,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: context.read<HadithCubit>().nawawy.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.white),
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Text(
                                  context
                                      .read<HadithCubit>()
                                      .nawawy[index]
                                      .id_ar,
                                  style: getMediumStyle(
                                    color: AppColors.primary,
                                    fontSize: context
                                        .read<FontCubit>()
                                        .state
                                        .toDouble(),
                                  ),
                                ),
                                const VerticalSpacer(height: 10),
                                Text(
                                  context
                                      .read<HadithCubit>()
                                      .nawawy[index]
                                      .topic,
                                  textAlign: TextAlign.center,
                                  style: getSemiBoldStyle(
                                    color: AppColors.primary,
                                    fontSize: context
                                        .read<FontCubit>()
                                        .state
                                        .toDouble(),
                                  ),
                                ),
                                const VerticalSpacer(height: 6),
                                Text(
                                  "( ${context.read<HadithCubit>().nawawy[index].rawi} )",
                                  textAlign: TextAlign.center,
                                  style: getMediumStyle(
                                    color: AppColors.primary,
                                    fontSize: 15,
                                  ),
                                ),
                                const VerticalSpacer(height: 14),
                                Image.asset(
                                  AssetConstants.divider,
                                  color: AppColors.primary,
                                ),
                                const VerticalSpacer(height: 6),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      context
                                          .read<HadithCubit>()
                                          .nawawy[index]
                                          .text,
                                      textAlign: TextAlign.center,
                                      style: getMediumStyle(
                                        color: AppColors.primary,
                                        fontSize: context
                                            .read<FontCubit>()
                                            .state
                                            .toDouble(),
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalSpacer(height: 6),
                                Image.asset(
                                  'assets/images/Frame 48.png',
                                  color: AppColors.primary,
                                ),
                                const VerticalSpacer(height: 6),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      context
                                          .read<HadithCubit>()
                                          .nawawy[index]
                                          .description,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                      maxLines: 24,
                                      style: getMediumStyle(
                                        color: AppColors.black,
                                        fontSize: context
                                            .read<FontCubit>()
                                            .state
                                            .toDouble(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const Expanded(child: CustomHadithShimmer());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
