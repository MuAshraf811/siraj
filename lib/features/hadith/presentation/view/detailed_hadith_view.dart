import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/hadith/presentation/cubit/hadith_cubit.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../other/presentation/widgets/hadith_shimmer.dart';
import '../../../quran/presentation/widgets/custom_app_bar.dart';

class DetailedHadithView extends StatelessWidget {
  const DetailedHadithView({super.key});

  @override
  Widget build(BuildContext context) {
    final label = ModalRoute.of(context)?.settings.arguments as String;
    context.read<HadithCubit>().watchHadithPagination(label);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 16),
              CustomAppBar(
                onTap: () {},
                doAlso: () {
                  context.read<HadithCubit>().hadith.clear();
                },
              ),
              const VerticalSpacer(height: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                margin: EdgeInsets.only(bottom: 12.h, left: 12.w, right: 12.w),
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Text(
                  translateHadithName(label),
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              BlocBuilder<HadithCubit, HadithState>(
                buildWhen: (previous, current) =>
                    current is LoadingHadithState ||
                    current is HadithErrorState ||
                    current is HadithSuccessState ||
                    current is PaginationState ||
                    current is ReadyPaginationState,
                builder: (context, state) {
                  if (state is HadithSuccessState ||
                      state is PaginationState ||
                      state is ReadyPaginationState) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller:
                            context.read<HadithCubit>().scrollController,
                        itemCount: context.read<HadithCubit>().isLoading
                            ? context.read<HadithCubit>().hadith.length + 1
                            : context.read<HadithCubit>().hadith.length,
                        itemBuilder: (context, index) {
                          if (index >=
                                  context.read<HadithCubit>().hadith.length &&
                              state is PaginationState) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: AppColors.primary,
                                  valueColor: AlwaysStoppedAnimation(
                                      AppColors.secondry),
                                ),
                              ),
                            );
                          }
                          return SingleHadithItem(
                              order: context
                                  .read<HadithCubit>()
                                  .hadith[index]
                                  .number,
                              hadith: context
                                  .read<HadithCubit>()
                                  .hadith[index]
                                  .arab);
                        },
                      ),
                    );
                  }
                  return const Expanded(
                    child: CustomHadithShimmer(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleHadithItem extends StatelessWidget {
  const SingleHadithItem({
    super.key,
    required this.order,
    required this.hadith,
  });
  final int order;
  final String hadith;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 10.h, left: 12.w, right: 12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 20.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r)),
                color: AppColors.secondry),
            child: Text(
              order.toString(),
              style: const TextStyle(color: AppColors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                hadith,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
