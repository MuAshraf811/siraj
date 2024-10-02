import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_assets.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/spacers.dart';
import '../../controller/provider/sebha_provider.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18.w,
                        color: AppColors.secondry,
                      )),
                ),
              ),
              const VerticalSpacer(height: 12),
              const SebhaList(),
            ],
          ),
        ),
      ),
    );
  }
}

class SebhaList extends StatelessWidget {
  const SebhaList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<SebhaProvider>(
        builder: (context, value, child) => ListView(
          children: [
            SebhaItem(
              zekr: 'أستغفر الله ',
              count: value.countEsghfar,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).estghfer();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetEstgher(),
            ),
            Image.asset(
              AssetConstants.divider,
              color: AppColors.secondry,
            ),
            SebhaItem(
              zekr: 'الله أكبر ',
              count: value.countTakber,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).kber();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetKeber(),
            ),
            Image.asset(
              AssetConstants.divider,
              color: AppColors.primary,
            ),
            SebhaItem(
              zekr: 'الحمدلله ',
              count: value.countHamed,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).hamed();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetHamed(),
            ),
            Image.asset(
              'assets/images/Frame 48.png',
              color: AppColors.primary,
            ),
            SebhaItem(
              zekr: ' سبحان الله ',
              count: value.countTasbeh,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).sebeh();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetSbeh(),
            ),
            Image.asset(
              'assets/images/Frame 48.png',
              color: AppColors.primary,
            ),
            SebhaItem(
              zekr: ' لا حول ولا قوة إلا بالله',
              count: value.countHowkala,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).hawkel();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetHawkel(),
            ),
            Image.asset(
              'assets/images/Frame 48.png',
              color: AppColors.primary,
            ),
            SebhaItem(
              zekr: ' لا إله إلا الله ',
              count: value.countHowkala,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).allahGod();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetsebhaofAllah(),
            ),
            Image.asset(
              'assets/images/Frame 48.png',
              color: AppColors.primary,
            ),
            SebhaItem(
              zekr: ' سبحان الله وبحمده \nسبحان الله العظيم',
              count: value.countTesbehKamel,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).sebeh2();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetsebeh2(),
            ),
            Image.asset(
              'assets/images/Frame 48.png',
              color: AppColors.primary,
            ),
            SebhaItem(
              zekr: 'اللهم صل علي محمد\n وعلي آله وصحبه وسلم',
              count: value.countSallah,
              onRebeat: () {
                Provider.of<SebhaProvider>(context, listen: false).sallah();
              },
              onReset: () => Provider.of<SebhaProvider>(context, listen: false)
                  .resetSallah(),
            ),
            const VerticalSpacer(height: 16),
          ],
        ),
      ),
    );
  }
}

class SebhaItem extends StatelessWidget {
  const SebhaItem({
    super.key,
    required this.zekr,
    required this.count,
    required this.onRebeat,
    required this.onReset,
  });

  final String zekr;
  final int count;
  final VoidCallback onRebeat;
  final VoidCallback onReset;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      margin: EdgeInsets.only(bottom: 28.h),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AssetConstants.sebhaShapeCounter,
                height: 100.h,
                width: 90.w,
                color: AppColors.secondry,
              ),
              Text(
                count.toString(),
                style: const TextStyle(
                  color: AppColors.secondry,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const HorizontalSpacer(width: 16),
          Column(
            children: [
              Text(
                zekr,
                style: getSemiBoldStyle(
                  color: AppColors.secondry,
                  fontSize: 19,
                ),
              ),
              const VerticalSpacer(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onTap: onReset,
                    buttonColor: AppColors.primary,
                    textColor: AppColors.white,
                    fontSize: 12,
                    borderRaduis: 4,
                    border: Border.all(color: AppColors.white.withOpacity(0.3)),
                    width: 52,
                    height: 32,
                    text: "صفر",
                  ),
                  const HorizontalSpacer(width: 9),
                  CustomButton(
                    onTap: onRebeat,
                    fontSize: 14,
                    buttonColor: AppColors.primary,
                    textColor: AppColors.white,
                    borderRaduis: 4,
                    border: Border.all(color: AppColors.white.withOpacity(0.3)),
                    width: 128,
                    height: 32,
                    text: "تكرار",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
