import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColor = Colors.blue;
  static Color secondaryColor = const Color.fromARGB(255, 45, 114, 188);
  static Color tertiaryColor = const Color.fromARGB(255, 138, 179, 223);
  static Color transparentColor = Colors.transparent;
  static Color backgroundColor = const Color(0xffF1F1F1);
  static Color starColor = const Color.fromARGB(255, 244, 203, 4);
  static Color dividerColor = const Color(0xFFBDBDBD);
  static Color grey800 = const Color.fromARGB(255, 77, 77, 77);
  static Color grey500 = Colors.grey;
  static Color grey400 = const Color.fromARGB(255, 185, 185, 185);
  static Color grey300 = const Color.fromRGBO(224, 224, 224, 1);
  static Color grey200 = const Color.fromRGBO(238, 238, 238, 1);
  static Color grey100 = const Color.fromRGBO(245, 245, 245, 1);
  static Color borderImageColor = const Color(0xFFF5F5F5);
  static Color doneColor = Colors.green;
  static Color blueColor = Colors.blue;
  static Color navyColor = const Color.fromARGB(255, 94, 102, 147);
  static Color purpleColor = Colors.purple;
  static Color dangerColor = Colors.red;
  static Color orangeColor = Colors.orange;
  static Color warningColor = Colors.yellow;
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;

  static void initialize({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? transparentColor,
    Color? backgroundColor,
    Color? starColor,
    Color? dividerColor,
    Color? grey800,
    Color? grey500,
    Color? grey400,
    Color? grey300,
    Color? grey200,
    Color? grey100,
    Color? borderImageColor,
    Color? doneColor,
    Color? blueColor,
    Color? navyColor,
    Color? purpleColor,
    Color? dangerColor,
    Color? orangeColor,
    Color? warningColor,
    Color? whiteColor,
    Color? blackColor,
  }) {
    if (primaryColor != null) AppColor.primaryColor = primaryColor;
    if (secondaryColor != null) AppColor.secondaryColor = secondaryColor;
    if (tertiaryColor != null) AppColor.tertiaryColor = tertiaryColor;
    if (transparentColor != null) AppColor.transparentColor = transparentColor;
    if (backgroundColor != null) AppColor.backgroundColor = backgroundColor;
    if (starColor != null) AppColor.starColor = starColor;
    if (dividerColor != null) AppColor.dividerColor = dividerColor;
    if (grey800 != null) AppColor.grey800 = grey800;
    if (grey500 != null) AppColor.grey500 = grey500;
    if (grey400 != null) AppColor.grey400 = grey400;
    if (grey300 != null) AppColor.grey300 = grey300;
    if (grey200 != null) AppColor.grey200 = grey200;
    if (grey100 != null) AppColor.grey100 = grey100;
    if (borderImageColor != null) AppColor.borderImageColor = borderImageColor;
    if (doneColor != null) AppColor.doneColor = doneColor;
    if (blueColor != null) AppColor.blueColor = blueColor;
    if (navyColor != null) AppColor.navyColor = navyColor;
    if (purpleColor != null) AppColor.purpleColor = purpleColor;
    if (dangerColor != null) AppColor.dangerColor = dangerColor;
    if (orangeColor != null) AppColor.orangeColor = orangeColor;
    if (warningColor != null) AppColor.warningColor = warningColor;
    if (whiteColor != null) AppColor.whiteColor = whiteColor;
    if (blackColor != null) AppColor.blackColor = blackColor;
  }
}
