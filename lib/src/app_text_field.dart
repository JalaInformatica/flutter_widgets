import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';
import 'package:flutter_widgets/theme/app_text_style.dart';

class AppTextField extends TextField{
  AppTextField({
    required BuildContext context,
    TextStyle? style,
    String? hintText,
    String? labelText,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputAction? inputAction = TextInputAction.done,
    TextEditingController? textEditingController,
    EdgeInsets? contentPadding,
    Color? normalBorder,
    Color? focusedBorder,
    Color? errorBorder,
    BorderRadius? borderRadius,
    super.onChanged,
    super.onSubmitted,
    super.autofocus,
    super.readOnly,
    super.keyboardType,
    super.maxLines,
    super.inputFormatters
  }) : super(
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      controller: textEditingController,
      style: style ?? AppTextStyle.textNStyle(),
      cursorColor: AppColor.primaryColor,
      textInputAction: inputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyle.textNStyle(
          color: AppColor.grey500,
        ),
        floatingLabelStyle: AppTextStyle.textNStyle(
          color: AppColor.primaryColor
        ),
        isDense: true,
        hintText: hintText,
        contentPadding: contentPadding,
        hintStyle: (
          style ?? AppTextStyle.textNStyle()).copyWith(
          color: AppColor.grey500,
        ),
        filled: fillColor!=null,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColor.grey500,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColor.grey500,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          borderSide:  BorderSide(color: normalBorder?? AppColor.grey100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          borderSide: BorderSide(color: normalBorder??AppColor.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          borderSide: BorderSide(color: focusedBorder??AppColor.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          borderSide: BorderSide(color: errorBorder?? AppColor.dangerColor),
        ),
      ));
}