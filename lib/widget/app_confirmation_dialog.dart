import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';
import 'package:flutter_widgets/theme/app_text_style.dart';

import 'app_clickable_text.dart';

class AppConfirmationDialog extends AlertDialog {
  AppConfirmationDialog({
    super.key,
    super.content,
    super.contentPadding,
    super.contentTextStyle,
    super.title,
    super.titlePadding,
    super.actionsPadding,
    super.shadowColor,
    required VoidCallback onCancel,
    required VoidCallback onApproved,
    String? approvedText,
  }) : super(
    backgroundColor: AppColor.whiteColor,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    titleTextStyle: AppTextStyle.textMdStyle(),
    scrollable: true,
    actions: [
      AppClickableText(
        onPressed: onCancel,
        child: Text("Batal", style: AppTextStyle.textMdStyle(color: AppColor.primaryColor),),
      ),
      AppClickableText(
        onPressed: onApproved, 
        child: Text(approvedText ?? "Iya")
      ),
    ]
  );
}
