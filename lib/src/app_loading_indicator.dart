import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';

class AppLoadingIndicator extends SizedBox{
  AppLoadingIndicator({
    double size = 12,
    double strokerSize = 2,
    Color? color
  }):super.square(
    dimension: size,
    child: CircularProgressIndicator(
      color: color ?? AppColor.primaryColor,
      strokeWidth: strokerSize,
    )
  );
}