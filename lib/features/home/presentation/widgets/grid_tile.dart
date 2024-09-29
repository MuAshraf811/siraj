import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/utils/functions/functions.dart';

import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/spacers.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });
  final String imagePath;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86.w,
      // height: 86.h,
      margin: EdgeInsets.only(left: 8.w, bottom: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: getthemecolor(context)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 44.w,
              height: 38.h,
              color: getthemecolor(context),
            ),
            const VerticalSpacer(height: 3),
            Text(
              text,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: getSemiBoldStyle(
                color: getthemecolor(context),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
