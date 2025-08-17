import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';
import 'package:flutter_widgets/theme/app_text_style.dart';

import 'app_icon.dart';

class AppFavoriteButton extends AppIcon {
  bool isFavorite;
  Function() addToFavorite;
  Function() removeFromFavorite;

  AppFavoriteButton({
    required this.addToFavorite,
    required this.removeFromFavorite,
    required this.isFavorite,
  }) : super(
          icon: isFavorite
              ? Icon(
                  Icons.favorite,
                  color: AppColor.primaryColor,
                )
              : Icon(
                  Icons.favorite_border,
                  color: AppColor.grey500,
                ),
          onPressed: isFavorite ? removeFromFavorite : addToFavorite,
        );
}

class AppFavoriteButtonSnackBar extends SnackBar {
  final bool isAddedToFavorite;
  AppFavoriteButtonSnackBar({
    super.key,
    required this.isAddedToFavorite,
  }) : super(
            content: isAddedToFavorite
                ? Text("Ditambahkan ke favorit",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.textNStyle(color: AppColor.whiteColor))
                : Text("Dihapus dari favorite",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textNStyle(
                        color: AppColor.whiteColor)));
}
