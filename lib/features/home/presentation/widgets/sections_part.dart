import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/routes_path_constants.dart';
import '../../../../core/utils/constants/sections_constanst.dart';
import '../../../../core/widgets/spacers.dart';

class SectionsContainer extends StatelessWidget {
  const SectionsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor.withOpacity(0.65),
        border: Border.all(color: AppColors.white, width: 1.5.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomGridTile(
                  index: 0,
                  onTap: () {
                    // context.read<QuranCubit>().loadSurah();
                    Navigator.pushNamed(context, RoutesConstants.surahsView);
                  },
                ),
                CustomGridTile(
                  index: 1,
                  onTap: () {},
                ),
                CustomGridTile(
                  index: 2,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomGridTile(
                  index: 3,
                  onTap: () {},
                ),
                CustomGridTile(
                  index: 4,
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesConstants.sebhaView),
                ),
                CustomGridTile(
                  index: 5,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomGridTile(
                  index: 6,
                  onTap: () {},
                ),
                CustomGridTile(
                  index: 7,
                  onTap: () {},
                ),
                CustomGridTile(
                  index: 8,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({super.key, required this.index, required this.onTap});
  final int index;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              sectionImage[index],
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const VerticalSpacer(height: 2),
        Text(
          sectionTitles[index],
          style: getMediumStyle(
            fontSize: 15,
            color: AppColors.blackText,
          ),
        ),
      ],
    );
  }
}
