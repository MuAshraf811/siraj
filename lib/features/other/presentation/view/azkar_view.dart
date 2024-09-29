import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../quran/presentation/widgets/custom_app_bar.dart';
import '../../controller/cubit/zekrand_sebha_cubit.dart';
import '../widgets/azkar_shimmer.dart';
import 'azkar_detailed_view.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpacer(height: 16),
            CustomAppBar(
              doAlso: () {},
            ),
            const VerticalSpacer(height: 22),
            BlocBuilder<ZekrandSebhaCubit, ZekrandSebhaState>(
              buildWhen: (previous, current) =>
                  current is InitializingAzkarErrorState ||
                  current is InitializingAzkarState ||
                  current is InitializingAzkarSuccessState,
              builder: (context, state) {
                if (state is InitializingAzkarSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.read<ZekrandSebhaCubit>().azkrMOdel.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AzkarDetailedView(index: index),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          margin: EdgeInsets.only(
                              left: 26.w, right: 18.w, bottom: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(26.r),
                              bottomLeft: Radius.circular(24.r),
                            ),
                          ),
                          child: Text(
                            context
                                .read<ZekrandSebhaCubit>()
                                .azkrMOdel[index]
                                .category,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const Expanded(
                  child: CustomAzkarShimmer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
