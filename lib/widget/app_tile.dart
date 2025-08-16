import 'package:flutter/material.dart';

class AppTile extends Container{
  AppTile({
    Widget title = const SizedBox.shrink(),
    Widget subtitle = const SizedBox.shrink(),
    Widget trailing = const SizedBox.shrink(),
    Widget leading = const SizedBox.shrink(),
    Color? backgroundColor,
    EdgeInsets? padding,
    List<BoxShadow>? boxShadow,
    BorderRadius? borderRadius
  }): super (
      padding: padding?? EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // leading,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              subtitle
            ]
          ),
          trailing
        ],
      )
    );
  }