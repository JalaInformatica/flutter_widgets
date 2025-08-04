import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';

class AppTextDropdown<T> extends Container{
  final T value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  AppTextDropdown({
    super.key, 
    required this.value,
    required this.items,
    required this.onChanged
  }) : super(
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.grey500),
      borderRadius: BorderRadius.circular(5)
    ),
    child: DropdownButton<T>(
    value: value,
    dropdownColor: AppColor.whiteColor,
    underline: SizedBox.shrink(),
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    elevation: 8,
    isDense: true,
    items: items,
    onChanged: onChanged)
  );
}