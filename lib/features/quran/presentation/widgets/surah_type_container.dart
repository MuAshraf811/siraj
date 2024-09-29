import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';

import '../../../../core/utils/constants/app_colors.dart';

class SurahTypeContainer extends StatelessWidget {
  const SurahTypeContainer({
    super.key,
    required this.type,
  });
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      height: 28.h,
      width: 42.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        type,
        style: getMediumStyle(fontSize: 13, color: AppColors.black),
      ),
    );
  }
}
