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
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: PageView.builder(
                  itemCount: 604,
                  physics: const CarouselScrollPhysics(),
                  controller: PageController(
                    initialPage: page ?? 1,
                    viewportFraction: 1.w,
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
    return Image.asset(
      'assets/images/quran1/${pageIndex + 1}.png',
      fit: BoxFit.contain,
    );
  }
}
