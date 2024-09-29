import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';
import '../../../../core/controllers/theme/theme_cubit.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/widgets/svg_handler.dart';
import '../../controller/home_cubit.dart';

class RandomZekrContainer extends StatelessWidget {
  const RandomZekrContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: context.read<ThemeCubit>().state == 0
            ? AppColors.white
            : AppColors.primary,
        border: Border.all(
          color: context.read<ThemeCubit>().state == 0
              ? AppColors.primary
              : AppColors.white,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    context.read<HomeCubit>().shareText();
                  },
                  child: BlocListener<HomeCubit, HomeState>(
                    listenWhen: (previous, current) =>
                        current is ShareRandomZekrState ||
                        current is ShareRandomZekrSuccessState,
                    listener: (context, state) {
                      if (state is ShareRandomZekrState) {
                        showCustomSnackBar(
                            context, 'Wait a second', AppColors.secondry);
                      }
                    },
                    child: const SvgHandler(
                      imagePath: AssetConstants.share,
                      height: 20,
                      width: 24,
                    ),
                  )),
              const HorizontalSpacer(width: 24),
              InkWell(
                onTap: () {
                  context.read<HomeCubit>().copyText(context);
                },
                child: SvgHandler(
                  imagePath: 'assets/svgs/order-nav.svg',
                  height: 20,
                  width: 24,
                  color: context.read<ThemeCubit>().state == 0
                      ? AppColors.primary
                      : AppColors.white,
                ),
              ),
              const Spacer(),
              Text(
                ' من الأذكار المنسية',
                style: getSemiBoldStyle(
                  fontSize: 18,
                  color: context.read<ThemeCubit>().state == 0
                      ? AppColors.primary
                      : AppColors.white,
                ),
              ),
            ],
          ),
          const VerticalSpacer(height: 12),
          Divider(
            color: context.read<ThemeCubit>().state == 0
                ? AppColors.primary
                : AppColors.white,
            endIndent: 16.w,
            indent: 16.w,
          ),
          const VerticalSpacer(height: 6),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is RandomZekrState ||
                current is RandomZekrSuccessState ||
                current is RandomZekrErrorState,
            builder: (context, state) {
              if (state is RandomZekrSuccessState) {
                return IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.read<HomeCubit>().someZekrCategoryName!,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: getSemiBoldStyle(
                          fontSize: 19,
                          color: context.read<ThemeCubit>().state == 0
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                      ),
                      const VerticalSpacer(height: 12),
                      Text(
                        context.read<HomeCubit>().randomZekeText,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: getMediumStyle(
                          fontSize: 17,
                          color: context.read<ThemeCubit>().state == 0
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 32.h,
                  width: 75.w,
                  margin: EdgeInsets.all(2.w),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
