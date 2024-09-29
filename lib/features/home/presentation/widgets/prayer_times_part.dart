import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../../core/widgets/spacers.dart';

class PrayerTimesContainer extends StatelessWidget {
  const PrayerTimesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 315.w,
      //height: 146.h,
      padding: EdgeInsets.only(right: 32.w, left: 18.w, top: 8.h),
      margin: EdgeInsets.only(bottom: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.9),
        border: Border.all(
          color: getthemecolor(context),
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Duhar',
                style: getSemiBoldStyle(
                  fontSize: 14,
                  color: AppColors.white,
                  isItalic: true,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    '01:15',
                    style: getSemiBoldStyle(
                      fontSize: 40,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                  const HorizontalSpacer(width: 5),
                  Text(
                    'pm',
                    style: getSemiBoldStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 12),
              Text(
                'Next Pray : Asr',
                style: getRegularStyle(
                  fontSize: 13,
                  color: AppColors.white,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    '03:32',
                    style: getSemiBoldStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                  const HorizontalSpacer(width: 5),
                  Text(
                    'pm',
                    style: getSemiBoldStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      isItalic: true,
                    ),
                  ),
                ],
              ),
              const VerticalSpacer(height: 12),
            ],
          ),
          Image.asset(
            'assets/images/jama-masjid 1.png',
            width: 128.w,
            color: AppColors.white.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
