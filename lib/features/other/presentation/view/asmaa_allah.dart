import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';
import 'package:siraj/features/other/controller/cubit/zekrand_sebha_cubit.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../widgets/hadith_shimmer.dart';

class AsmaaAllahView extends StatelessWidget {
  const AsmaaAllahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 8),
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
              const VerticalSpacer(height: 10),
              BlocBuilder<ZekrandSebhaCubit, ZekrandSebhaState>(
                buildWhen: (previous, current) =>
                    current is AsmaaAllahLoadingState ||
                    current is AsmaaAllahLoadedState,
                builder: (context, state) {
                  if (state is AsmaaAllahLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount:
                            context.read<ZekrandSebhaCubit>().asmaaAllah.length,
                        separatorBuilder: (context, index) => Image.asset(
                          AssetConstants.divider,
                          color: AppColors.primary,
                        ),
                        itemBuilder: (context, index) => Container(
                          width: 200.w,
                          margin: EdgeInsets.only(bottom: 12.h, top: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      context
                                          .read<ZekrandSebhaCubit>()
                                          .asmaaAllah[index]
                                          .ttl,
                                      style: getSemiBoldStyle(
                                        fontSize: 17,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  const HorizontalSpacer(width: 12),
                                  Container(
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
                                ],
                              ),
                              const VerticalSpacer(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(
                                  context
                                      .read<ZekrandSebhaCubit>()
                                      .asmaaAllah[index]
                                      .dsc,
                                  style: getSemiBoldStyle(
                                    fontSize: 17,
                                    color: AppColors.blackText,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const VerticalSpacer(height: 12),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const Expanded(
                    child: CustomHadithShimmer(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
