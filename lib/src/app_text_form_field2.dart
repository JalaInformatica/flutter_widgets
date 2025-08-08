import 'package:flutter/material.dart';

class AppTextField2 extends Column{
  AppTextField2({
    required BuildContext context,
    TextStyle? style,
    String? hintText,
    String? labelText,
    Color? fillColor,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputAction? inputAction = TextInputAction.done,
    TextEditingController? textEditingController,
    EdgeInsets? contentPadding,
    bool isThousand = false,
    Function(String)? onChanged,
    bool readOnly = false,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    Function(String)? onSubmitted,
    bool disabled = false,
    bool unfocusWhenTapOutside = true,
    Function(PointerDownEvent)? onTapOutside,
    String? errorText,
  }) : super(
    spacing: 3.h,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        textAlign: textAlign,
        maxLines: maxLines,
        onSubmitted: onSubmitted,
        onTapOutside: unfocusWhenTapOutside? (e) {
          onTapOutside?.call(e);
          FocusScope.of(context).unfocus();
        } : null,
        readOnly: disabled || readOnly,
        onChanged: (val){
          if (isThousand && textEditingController!=null) {
            // Store the original cursor position
            int cursorPosition = textEditingController.selection.baseOffset;

            // Remove any existing separators before formatting
            String cleanValue = val.replaceAll(".", "").replaceAll(",", "").replaceAll(RegExp(r'\D'), '');
            
            // Format the number
            String formattedText = formatThousands(cleanValue);

            // Calculate new cursor position after formatting
            int newCursorPosition = formattedText.length - (cleanValue.length - cursorPosition);

            // Ensure the cursor stays within valid bounds
            newCursorPosition = newCursorPosition.clamp(0, formattedText.length);

            // Update the text field with formatted value and adjusted cursor position
            textEditingController.value = TextEditingValue(
              text: formattedText,
              selection: TextSelection.collapsed(offset: newCursorPosition),
            );
          }
          onChanged?.call(val);
        },
        controller: textEditingController,
        style: style ?? AppTextStyle.textBodyStyle(),
        cursorColor: AppColor.primaryColor,
        textInputAction: inputAction,
        decoration: InputDecoration(
          filled: disabled || fillColor!=null,
          fillColor: disabled ? AppColor.grey100 : fillColor,
          labelText: labelText,
          labelStyle: AppTextStyle.textBodyStyle(
            color: AppColor.grey500,
          ),
          floatingLabelStyle: AppTextStyle.textBodyStyle(
            color: !disabled? AppColor.primaryColor : AppColor.grey500
          ),
          isDense: true,
          hintText: hintText,
          contentPadding: contentPadding,
          hintStyle: (
            style ?? AppTextStyle.textBodyStyle()).copyWith(
            color: AppColor.grey500,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: AppColor.grey500,
          suffixIcon: suffixIcon,
          suffixIconColor: AppColor.grey500,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColor.grey100),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColor.grey300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColor.dangerColor),
          ),
        )
      ),
      if(errorText!=null)
      Text(errorText, style: AppTextStyle.textBodyStyle(color: AppColor.dangerColor),)
    ],
  );
}