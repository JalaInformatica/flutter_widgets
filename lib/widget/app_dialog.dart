import 'package:flutter/material.dart';
import 'package:flutter_widgets/core/theme/theme.dart';
import 'package:flutter_widgets/widget/app_normal_button.dart';

class AppDialog extends Dialog {
  AppDialog({
    super.key,
    EdgeInsets? padding,
    Widget? title,
    Widget? child,
    List<Widget>? actions
  }) : super(
    backgroundColor: AppColor.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: padding ?? EdgeInsets.all(20),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title !=null) title,
          if (child != null) child,
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(actions!=null) ...actions
            ],
          )

        ],
      ),
    ),
  );

  factory AppDialog.actions({
    EdgeInsets? padding,
    Widget? title,
    Widget? child,
    Color? cancelTextColor,
    Color? cancelBackgroundColor,
    required Function() onCancel,
    required String cancelText,
    required Function() onConfirm,
    Color? confirmTextColor,
    Color? confirmBackgroundColor,
    required String confirmText
  }){
    return AppDialog(
      padding: padding,      
      title: title,
      actions: [
        Expanded(child: AppTextButton(
          borderColor: AppColor.grey500,
          backgroundColor: AppColor.whiteColor,
          foregroundColor: AppColor.blackColor,
          onPressed: (){
            onCancel();
          },
          child: Text(cancelText, style: AppTextStyle.textNStyle(),), 
        )),
        Expanded(child: AppTextButton(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.whiteColor,
          onPressed: (){
            onConfirm();
          },
          child: Text(cancelText, style: AppTextStyle.textNStyle(),), 
        )),
      ],
      child: child
    );
  }
}
