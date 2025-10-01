import 'package:flutter/material.dart';
import '../core/theme/theme.dart';
import 'app_clickable_text.dart';

class AppDataContainer extends SizedBox{
  AppDataContainer({
    super.key, 
    required bool hasData,
    required IconData noDataIcon,
    required String noDataText,
    required Widget child,
  }) : super(
        child: hasData? child : 
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
                Icon(noDataIcon, color: AppColor.grey500, size: 50,),
                Text(noDataText, style: AppTextStyle.textLgStyle(color: AppColor.grey500),),
            ]
        )
    );
}