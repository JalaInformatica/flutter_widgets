import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/theme/app_color.dart';
import 'package:flutter_widgets/theme/app_text_style.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField({
    super.key,
    super.onTap,
    super.readOnly,
    required BuildContext context,
    super.validator,
    super.onFieldSubmitted,
    super.maxLines,
    super.focusNode,
    super.autofocus,
    super.obscureText,
    TextStyle? style,
    String? hintText,
    String? labelText,
    Color? fillColor,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputAction? inputAction = TextInputAction.done,
    required TextEditingController textEditingController,
    bool unfocusWhenTapOutside = true,
  }) : super(
            onTapOutside: unfocusWhenTapOutside
                ? (_) {
                    FocusScope.of(context).unfocus();
                  }
                : null,
            controller: textEditingController,
            keyboardType: keyboardType,
            style: style ?? AppTextStyle.textNStyle(),
            cursorColor: AppColor.primaryColor,
            textInputAction: inputAction,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: AppTextStyle.textNStyle(
                color: AppColor.grey500,
              ),
              floatingLabelStyle:
                  AppTextStyle.textNStyle(color: AppColor.primaryColor),
              isDense: true,
              hintText: hintText,
              hintStyle: (style ?? AppTextStyle.textNStyle()).copyWith(
                color: AppColor.grey500,
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
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
            ));
}
