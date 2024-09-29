import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_font_manager.dart';
import '../utils/constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.suffixIcon,
    this.borderRaduis,
    this.validator,
    this.textEditingController,
    this.keyboardType,
    this.obscureText,
    this.suffixIconPadding,
    this.labelStyle,
    this.suffixIconColor,
    this.isFilled,
    this.textFormFieldHeight,
    this.onChanged,
    this.onFieldSubmitted,
    this.isBuildCounterWantd = false,
    this.maxLength,
    this.prefixIcon,
    this.fillColor,
    this.fontColor,
    this.verticalPadding,
    this.minLines,
    this.labelWidget,
    this.readOnly,
    this.maxLines,
    this.onTap,
  });
  final double? suffixIconPadding;
  final String? Function(String?)? validator;
  final String label;
  final double? borderRaduis;
  final double? verticalPadding;
  final TextInputType? keyboardType;
  final Color? fontColor;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final Widget suffixIcon;
  final TextStyle? labelStyle;
  final Color? suffixIconColor;
  final Color? fillColor;
  final bool? readOnly;
  final bool? isFilled;
  final double? textFormFieldHeight;
  final void Function(String val)? onChanged;
  final void Function(String val)? onFieldSubmitted;
  final VoidCallback? onTap;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool isBuildCounterWantd;
  final int? minLines;
  final int? maxLines;
  final Widget? labelWidget;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isFoucsed = false;
  Widget? prefixIconReturn() {
    if (isFoucsed) {
      setState(() {});

      return widget.prefixIcon;
    }
    setState(() {});
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
        isFoucsed = false;
        setState(() {
          //isFoucsed = false;
        });
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      maxLength: widget.maxLength ?? 100,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 2,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      buildCounter: (context,
          {required currentLength, required isFocused, maxLength}) {
        return !widget.isBuildCounterWantd
            ? null
            : Transform(
                transform: Matrix4.translationValues(0, 2.h, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$currentLength ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: '|$maxLength',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
      cursorColor: AppColors.primary,
      cursorHeight: 20.h,
      cursorWidth: 1.5.w,
      autocorrect: true,
      obscuringCharacter: '*',
      style: TextStyle(
          fontSize: 14,
          color: isFoucsed
              ? widget.fontColor ?? AppColors.primary
              : AppColors.greyText,
          fontFamily: FontConstants.caroFamily),
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? AppColors.greyText.withOpacity(0.18),
        suffixIconConstraints: BoxConstraints(minHeight: 16.h, minWidth: 16.w),
        constraints: BoxConstraints(
          maxHeight: widget.textFormFieldHeight?.h ?? 52.h,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w, vertical: widget.verticalPadding ?? 2.h),
        label: widget.labelWidget ??
            Text(
              widget.label,
              style: widget.labelStyle ??
                  TextStyle(
                      fontSize: 14,
                      color: isFoucsed && isKeyboard
                          ? AppColors.primary
                          : AppColors.blackText,
                      fontFamily: FontConstants.caroFamily),
            ),
        prefixIcon: //prefixIconReturn(),
            Padding(
          padding: EdgeInsets.only(left: 8.w, right: 4.w),
          child: widget.prefixIcon,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
              right: widget.suffixIconPadding ?? 14.0.w, left: 8.w),
          child: widget.suffixIcon,
        ),
        suffixIconColor: isFoucsed && isKeyboard
            ? AppColors.primary
            : widget.suffixIconColor ?? AppColors.greyText,
        filled: widget.isFilled ?? true,
        focusColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
        ),
        isDense: false,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRaduis?.r ?? 24.r),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
