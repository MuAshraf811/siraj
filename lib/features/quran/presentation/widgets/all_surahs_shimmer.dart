import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllSurahsShimmer extends StatelessWidget {
  const AllSurahsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
          endIndent: 12.w,
          indent: 12.w,
          height: 18.h,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) => ListTile(
          title: Container(
            height: 24.h,
            width: 42.w,
            color: Colors.grey.shade300,
          ),
          subtitle: Container(
            height: 16.h,
            width: 32.w,
            color: Colors.grey.shade300,
          ),
          leading: Container(
            height: 16.h,
            width: 20.w,
            color: Colors.grey.shade300,
          ),
          trailing: Container(
            height: 28.h,
            width: 32.w,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
