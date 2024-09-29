import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siraj/core/styles/text_styles.dart';
import 'package:siraj/core/utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.width,
      required this.height,
      required this.text,
      this.borderRaduis,
      this.textColor,
      this.buttonColor,
      this.fontSize,
      this.prefix,
      this.border,
      this.mainAxixAlign,
      this.sufix,
      this.horizontalPadding});

  final double width;
  final double height;
  final String text;
  final void Function()? onTap;
  final double? borderRaduis;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final Widget? prefix;
  final Widget? sufix;
  final BoxBorder? border;
  final MainAxisAlignment? mainAxixAlign;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRaduis ?? 18.r),
      child: Container(
        width: width.w,
        height: height.h,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding?.w ?? 0),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRaduis?.r ?? 24.r),
          border: border,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: mainAxixAlign ?? MainAxisAlignment.center,
          children: [
            prefix ?? const SizedBox.shrink(),
            sufix ??
                Text(
                  text,
                  style: getMediumStyle(
                    fontSize: fontSize ?? 16,
                    color: textColor ?? AppColors.white,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
