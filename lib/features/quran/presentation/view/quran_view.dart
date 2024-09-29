import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/utils/constants/app_colors.dart';
import 'package:siraj/features/quran/presentation/widgets/quran_view_appbar.dart';
import '../../../../core/widgets/spacers.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key, this.page});
  final int? page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const VerticalSpacer(height: 10),
            const QuranAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: PageView.builder(
                  itemCount: 604,
                  controller: PageController(
                    initialPage: page ?? 1,
                    viewportFraction: 0.73.w,
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      QuranOnePageItem(pageIndex: index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuranOnePageItem extends StatelessWidget {
  const QuranOnePageItem({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InteractiveViewer(
          maxScale: 3,
          minScale: 0.25,
          panEnabled: true,
          child: Image.asset(
            'assets/images/quran1/${pageIndex + 1}.png',
          ),
        ),
        const VerticalSpacer(height: 4),
        Divider(
          endIndent: 32.w,
          indent: 32.w,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
