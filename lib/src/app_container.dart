import 'package:flutter/material.dart';

class AppContainer extends Container {
  AppContainer({
    EdgeInsets? padding,
    Color? color,
    BoxBorder? border,
    double? radius,
    super.child
  }):super(
    padding: padding ?? EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius ?? 10),
      border: border
    )
  );
}