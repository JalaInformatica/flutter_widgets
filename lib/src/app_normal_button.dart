import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';

enum AppTextButtonSize {
  small,
  big
}

class AppTextButton extends TextButton {
  AppTextButton({
    super.key, 
    required VoidCallback? onPressed,
    required Widget child, 
    IconData? icon,
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    bool isLoading = false, 
    bool disabled = false,
    EdgeInsets? padding, 
    AppTextButtonSize size = AppTextButtonSize.small,
    Alignment? alignment,
    OutlinedBorder? shape,
    double? borderSize,
  }) : super(
        onPressed: !disabled? onPressed : null,
        child: icon==null? child : Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            Icon(icon, color: !disabled? foregroundColor ?? AppColor.primaryColor : AppColor.grey400,),
            child,
          ],
        ),
        style: TextButton.styleFrom(
          foregroundColor: !disabled? foregroundColor ?? AppColor.primaryColor : AppColor.grey400,
          backgroundColor: !disabled? backgroundColor ?? Colors.white : AppColor.grey200,
          visualDensity: size == AppTextButtonSize.small? VisualDensity.compact : VisualDensity.standard,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding,
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(width: borderSize ?? 1, color: !disabled? borderColor ?? AppColor.primaryColor : AppColor.grey400),
          ),
          alignment: alignment
        ),
      );
}