import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/hadith/presentation/cubit/hadith_cubit.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../../core/widgets/spacers.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 12.w, right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                translateHadithName(
                    context.read<HadithCubit>().hadithBooks[index].id),
                style: const TextStyle(
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const VerticalSpacer(height: 6),
              Text(context.read<HadithCubit>().hadithBooks[index].id),
            ],
          ),
          Column(
            children: [
              const Text(
                "عدد الأحاديث",
              ),
              const VerticalSpacer(height: 6),
              Text(
                context
                    .read<HadithCubit>()
                    .hadithBooks[index]
                    .available
                    .toString(),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
