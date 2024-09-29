import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../../core/widgets/svg_handler.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.primary,
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primary,
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      floating: true,
      collapsedHeight: 50.h,
      toolbarHeight: 50.h,
      expandedHeight: 112.h,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Text(
              " إِنَّ الدِّينَ عِنْدَ اللَّهِ الإِسْلامُ ",
              style: getMediumStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/jama-masjid 1.png",
                color: AppColors.white.withOpacity(0.3),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const VerticalSpacer(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الشرقية - مصر',
                        style: getMediumStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      const HorizontalSpacer(width: 10),
                      const SvgHandler(
                        imagePath: AssetConstants.location,
                        height: 17,
                        width: 17,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  const VerticalSpacer(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '  أغسطس - 12 جماد الأول',
                        style: getMediumStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      const HorizontalSpacer(width: 10),
                      const SvgHandler(
                        imagePath: AssetConstants.calender,
                        height: 16,
                        width: 16,
                        color: AppColors.white,
                      )
                    ],
                  ),
                  const VerticalSpacer(height: 4),
                  Divider(
                    color: AppColors.white.withOpacity(0.5),
                    indent: 160.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
