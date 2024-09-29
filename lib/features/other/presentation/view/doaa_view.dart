import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';
import 'package:siraj/features/other/controller/cubit/zekrand_sebha_cubit.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/hadith_shimmer.dart';

class DoaaView extends StatelessWidget {
  const DoaaView({super.key});
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
              BlocBuilder<ZekrandSebhaCubit, ZekrandSebhaState>(
                buildWhen: (previous, current) =>
                    current is DoaaLoadingState || current is DoaaLoadedState,
                builder: (context, state) {
                  debugPrint(state.toString());
                  if (state is DoaaLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount:
                            context.read<ZekrandSebhaCubit>().doaa.length,
                        separatorBuilder: (context, index) => Image.asset(
                          AssetConstants.divider,
                          color: AppColors.primary,
                        ),
                        itemBuilder: (context, index) => Container(
                          width: 200.w,
                          margin: EdgeInsets.only(bottom: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.white),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 28.w,
                                  height: 20.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.8),
                                  ),
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacer(height: 6),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    context
                                        .read<ZekrandSebhaCubit>()
                                        .doaa[index]
                                        .text,
                                    textAlign: TextAlign.center,
                                    style: getSemiBoldStyle(
                                      fontSize: 17,
                                      color: AppColors.blackText,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacer(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (state is DoaaLoadingState) {
                    return const Expanded(child: CustomHadithShimmer());
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
