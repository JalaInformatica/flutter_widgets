import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';

class AppRefreshIndicator extends RefreshIndicator {
  AppRefreshIndicator({
    super.key, 
    required super.child,
    required super.onRefresh,
  }):super(
    backgroundColor: AppColor.whiteColor,
    color: AppColor.secondaryColor
  );
}