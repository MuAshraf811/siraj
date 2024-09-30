import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/home/presentation/widgets/custom_search.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../../core/widgets/spacers.dart';
import '../../controller/quran_cubit.dart';
import '../widgets/all_surahs_shimmer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/surah_item.dart';
import 'quran_view.dart';

class SurahsView extends StatelessWidget {
  const SurahsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 26.h,
          ),
          child: Column(
            children: [
              CustomAppBar(
                doAlso: () {},
                onTap: () async {
                  await showSearch(context: context, delegate: CustomSearch());
                },
              ),
              const VerticalSpacer(height: 24),
              BlocBuilder<QuranCubit, QuranState>(
                buildWhen: (previous, current) =>
                    current is ListingSurahsState ||
                    current is ListingSurahsErrorState ||
                    current is ListingSurahsSuccessState,
                builder: (context, state) {
                  if (state is ListingSurahsSuccessState) {
                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(
                            left: 12.w, right: 12.w, bottom: 28.h),
                        itemCount: context.read<QuranCubit>().allSurahs.length,
                        separatorBuilder: (context, index) => Divider(
                          endIndent: 8.w,
                          indent: 8.w,
                          height: 18.h,
                          color: AppColors.secondry,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuranView(
                                  page:
                                      goToSpacificSurahDependOnItsOrder(index),
                                ),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          highlightColor: AppColors.white,
                          hoverColor: AppColors.primary.withOpacity(0.2),
                          child: SurahItem(index: index),
                        ),
                      ),
                    );
                  }
                  return const Expanded(
                    child: AllSurahsShimmer(),
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
