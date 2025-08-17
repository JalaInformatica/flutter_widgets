import 'package:flutter/material.dart';
import 'package:flutter_widgets/core/utils/app_navigator.dart';

import '../../widget/app_normal_button.dart';
import '../theme/theme.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final Widget reloadPage;
  const ErrorPage({required this.title, required this.reloadPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min, 
        children: [
        Icon(Icons.error_outline, size: titleSize*3, color: AppColor.primaryColor,),
        Text(
          title,
          style: AppTextStyle.textXlStyle(),
        ),
        AppTextButton(
          foregroundColor: AppColor.primaryColor,
          onPressed: (){
            AppNavigator.navigatePushReplace(context, reloadPage);
          },
          child: Text("Muat Ulang", style: AppTextStyle.textLgStyle(),),
        ),
      ])),
    );
  }
}
