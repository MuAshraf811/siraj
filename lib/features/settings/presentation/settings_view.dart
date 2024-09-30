// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/controllers/font/font_cubit.dart';
import '../../../core/controllers/theme/theme_cubit.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/widgets/spacers.dart';
import '../../../core/widgets/svg_handler.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: ListView(
          children: [
            const VerticalSpacer(height: 22),
            ProfileInfoContainer(),
            const VerticalSpacer(height: 12),
            SystemSettingContainer(),
            const VerticalSpacer(height: 12),
            const FontSizeSlider(),
            const AboutApplicationContainer(),
            const VerticalSpacer(height: 16),
          ],
        ),
      ),
    );
  }
}

class SystemSettingContainer extends StatelessWidget {
  const SystemSettingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          const SwitchWithText(
            text: "الوضع الليلي",
            isDarkTheme: true,
          ),
          const VerticalSpacer(height: 16),
          const SwitchWithText(
            text: "تفعيل الإشعارات",
            isDarkTheme: false,
          ),
          const VerticalSpacer(height: 16),
          const LanguageDropDown(),
        ],
      ),
    );
  }
}

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.w,
            backgroundColor: AppColors.primary,
          ),
          const HorizontalSpacer(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Muhammed Ashraf",
                style: TextStyle(
                  fontSize: context.read<FontCubit>().state.toDouble(),
                ),
              ),
              const VerticalSpacer(height: 10),
              Row(
                children: [
                  SvgHandler(
                      imagePath: 'assets/svgs/location2.svg',
                      height: 18,
                      width: 18),
                  const HorizontalSpacer(width: 10),
                  Text(
                    "Cairo , Egypt",
                    style: TextStyle(
                        fontSize: context.read<FontCubit>().state.toDouble()),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const SvgHandler(
              imagePath: 'assets/svgs/Frame.svg',
              height: 22,
              width: 22,
              color: AppColors.greyText,
            ),
          )
        ],
      ),
    );
  }
}

class AboutApplicationContainer extends StatelessWidget {
  const AboutApplicationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      margin: EdgeInsets.only(top: 14.h, bottom: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SettingGridItem(
                path: "",
                text: "قيم \nالتطبيق",
              ),
              SettingGridItem(
                path: "",
                text: "انشر\n التطبيق",
              ),
              SettingGridItem(
                path: "",
                text: "تابعنا \n",
              ),
              SettingGridItem(
                path: "",
                text: "تواصل مع \nالمطور",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SettingGridItem extends StatelessWidget {
  const SettingGridItem({
    super.key,
    required this.path,
    required this.text,
  });
  final String path;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.secondry,
            radius: 24.w,
          ),
          const VerticalSpacer(height: 4),
          Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: context.read<FontCubit>().state.toDouble()),
          ),
        ],
      ),
    );
  }
}

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownMenu(
            initialSelection: 0,
            inputDecorationTheme: InputDecorationTheme(
                iconColor: AppColors.secondry,
                focusColor: AppColors.primary,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: AppColors.primary,
                ))),
            menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.white),
                shadowColor: WidgetStatePropertyAll(
                  AppColors.primary.withOpacity(0.5),
                ),
                padding: WidgetStatePropertyAll(EdgeInsets.only(
                  top: 10.h,
                )),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(
                        color: AppColors.secondry,
                        style: BorderStyle.none,
                      )),
                )),
            dropdownMenuEntries: [
              DropdownMenuEntry<int>(value: 0, label: "arabic"),
              DropdownMenuEntry<int>(value: 1, label: "english"),
              DropdownMenuEntry<int>(value: 2, label: "french")
            ],
          ),
          Text(
            "اللغة",
            style: const TextStyle(
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}

class FontSizeSlider extends StatefulWidget {
  const FontSizeSlider({
    super.key,
  });

  @override
  State<FontSizeSlider> createState() => _FontSizeSliderState();
}

class _FontSizeSliderState extends State<FontSizeSlider> {
  double cuurent = 16;
  @override
  Widget build(BuildContext context) {
    cuurent = context.read<FontCubit>().state.toDouble();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        children: [
          Text(
            'حجم النص    :     ${cuurent.toInt()}',
            style: TextStyle(
              color: AppColors.black,
              fontSize: context.read<FontCubit>().state.toDouble(),
            ),
          ),
          const VerticalSpacer(height: 12),
          Slider.adaptive(
            value: cuurent,
            onChanged: (val) {
              context.read<FontCubit>().emitIneger(val.toInt());
              setState(() {
                cuurent = val;
              });
            },
            min: 12,
            max: 30,
            divisions: 9,
            thumbColor: AppColors.primary,
            activeColor: AppColors.secondry,
            inactiveColor: AppColors.primary.withOpacity(0.25),
            label: "حجم الخط",
          ),
          const VerticalSpacer(height: 12),
          Text(
            'وَسَبِّحْ بِحَمْدِ رَبِّكَ حِينَ تَقُومُ ',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.black,
              fontSize: cuurent,
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchWithText extends StatefulWidget {
  const SwitchWithText({
    super.key,
    required this.text,
    required this.isDarkTheme,
  });
  final String text;
  final bool isDarkTheme;
  @override
  State<SwitchWithText> createState() => _SwitchWithTextState();
}

class _SwitchWithTextState extends State<SwitchWithText> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Switch.adaptive(
            value: val,
            onChanged: (value) {
              if (widget.isDarkTheme) {
                context.read<ThemeCubit>().emitIneger(value ? 1 : 0);
              } else {}
              setState(() {
                val = value;
              });
            },
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.secondry.withOpacity(0.25),
            trackOutlineColor: const WidgetStatePropertyAll(AppColors.primary),
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: context.read<FontCubit>().state.toDouble(),
            ),
          )
        ],
      ),
    );
  }
}
