import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/features/home/presentation/widgets/grid_tile.dart';
import '../../../../core/utils/constants/routes_path_constants.dart';
import '../../../../core/utils/constants/sections_constanst.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomGridTile(
                imagePath: sectionImage[0],
                text: sectionTitles[0],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.surahsView);
                },
              ),
              CustomGridTile(
                imagePath: sectionImage[1],
                text: sectionTitles[1],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.doaaView);
                },
              ),
              CustomGridTile(
                imagePath: sectionImage[2],
                text: sectionTitles[2],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.azkarView);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomGridTile(
                imagePath: sectionImage[3],
                text: sectionTitles[3],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.nawawyView);
                },
              ),
              CustomGridTile(
                imagePath: sectionImage[4],
                text: sectionTitles[4],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.asmaaAllahView);
                },
              ),
              CustomGridTile(
                imagePath: sectionImage[5],
                text: sectionTitles[5],
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomGridTile(
                imagePath: sectionImage[6],
                text: sectionTitles[6],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.sebhaView);
                },
              ),
              CustomGridTile(
                imagePath: sectionImage[7],
                text: sectionTitles[7],
                onTap: () {
                  Navigator.pushNamed(context, RoutesConstants.hadithView);
                },
              ),
              CustomGridTile(
                imagePath: sectionImage[8],
                text: sectionTitles[8],
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
