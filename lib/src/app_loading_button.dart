import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';

enum AppLoadingButtonSize {
  small,
  big
}

class AppLoadingButton extends TextButton {
  AppLoadingButton({
    super.key, 
    required VoidCallback? onPressed,
    required Widget child, 
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    bool isLoading = false, 
    bool disabled = false,
    AppLoadingButtonSize size = AppLoadingButtonSize.small
  }) : super(
          onPressed: !disabled? onPressed : null,
          child: Row(
            mainAxisSize: MainAxisSize.min, 
            children: [
              if (isLoading)
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: foregroundColor ?? AppColor.primaryColor,
                    ),
                  ),
                ),
              child, // Button label
            ],
          ),
          style: TextButton.styleFrom(
          foregroundColor: !disabled? foregroundColor ?? AppColor.primaryColor : AppColor.grey400,
          backgroundColor: !disabled? backgroundColor ?? Colors.white : AppColor.grey200,
          visualDensity: size == AppLoadingButtonSize.small? VisualDensity.compact : VisualDensity.standard,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: !disabled? borderColor ?? AppColor.primaryColor : AppColor.grey400),
          ),
        ),
        );
}

