import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/features/quran/controller/quran_cubit.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import 'surah_type_container.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_back_ios,
          fill: 0,
          weight: 0.2,
          size: 18,
          color: AppColors.black,
        ),
        const HorizontalSpacer(width: 14),
        context.read<QuranCubit>().allSurahs[index].type == "Medinan"
            ? const SurahTypeContainer(type: "مدنية")
            : const SurahTypeContainer(type: "مكية"),
        const HorizontalSpacer(width: 14),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              context.read<QuranCubit>().allSurahs[index].surahArabicName,
              style: getMediumStyle(fontSize: 16, color: AppColors.blackText),
            ),
            const VerticalSpacer(height: 4),
            Text(
              context
                  .read<QuranCubit>()
                  .allSurahs[index]
                  .englishTranslationName,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const HorizontalSpacer(width: 20),
        Container(
          width: 28.w,
          height: 28.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            context.read<QuranCubit>().allSurahs[index].surahOrder.toString(),
          ),
        ),
      ],
    );
  }
}
