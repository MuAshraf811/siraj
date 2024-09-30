import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/widgets/svg_handler.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.doAlso,
    this.label,
    required this.onTap,
  });
  final VoidCallback? doAlso;
  final VoidCallback onTap;

  final String? label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            doAlso!();
            Navigator.pop(context);
          },
          child: Container(
            width: 44.w,
            height: 42.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.textFieldFillColor.withOpacity(0.6),
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(14.w),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              fill: 0,
              weight: 0.2,
              size: 20,
              color: AppColors.primary,
            ),
          ),
        ),
        const HorizontalSpacer(width: 18),
        SizedBox(
          width: 255.w,
          child: CustomTextFormField(
            label: label ?? "البحث عن سورة",
            onTap: onTap,
            fillColor: AppColors.textFieldFillColor.withOpacity(0.6),
            borderRaduis: 14,
            prefixIcon: const SvgHandler(
              imagePath: AssetConstants.search,
              color: AppColors.primary,
              height: 20,
              width: 20,
            ),
            suffixIcon: const SvgHandler(
              imagePath: 'assets/svgs/search.svg',
              height: 26,
              width: 26,
            ),
          ),
        ),
      ],
    );
  }
}
