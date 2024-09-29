import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomAzkarShimmer extends StatelessWidget {
  const CustomAzkarShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          margin: EdgeInsets.only(left: 26.w, right: 18.w, bottom: 14.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(26.r),
              bottomRight: Radius.circular(26.r),
            ),
          ),
        ),
      ),
    );
  }
}
