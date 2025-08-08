import 'package:flutter/material.dart';
import '../core/theme/theme.dart';

class AppTapDetector extends TextButton {
  AppTapDetector({
    super.key, 
    super.onPressed,
    required super.child
  }):super(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.blackColor,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact
    )
  );
}