import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../quran/presentation/widgets/custom_app_bar.dart';
import '../../controller/cubit/zekrand_sebha_cubit.dart';

class AzkarDetailedView extends StatelessWidget {
  const AzkarDetailedView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 18),
              CustomAppBar(
                label: "البحث عن ذكر ",
                doAlso: () {},
                onTap: () {},
              ),
              const VerticalSpacer(height: 16),
              BlocProvider(
                create: (context) =>
                    ZekrandSebhaCubit()..chooseSpacificZekr(index: index),
                child: BlocBuilder<ZekrandSebhaCubit, ZekrandSebhaState>(
                  buildWhen: (previous, current) =>
                      current is DetailedAzkarState ||
                      current is DetailedAzkarSuccessState,
                  builder: (context, state) {
                    if (state is DetailedAzkarSuccessState) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: BlocProvider.of<ZekrandSebhaCubit>(context)
                              .someZekr!
                              .length,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 12.h),
                            margin: EdgeInsets.only(bottom: 16.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                BlocProvider.of<ZekrandSebhaCubit>(context)
                                    .someZekr![index]
                                    .text,
                                textAlign: TextAlign.center,
                                style: getSemiBoldStyle(
                                  fontSize: 16,
                                  color: AppColors.blackText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
