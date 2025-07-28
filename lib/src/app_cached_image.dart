import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';

class AppCachedImage extends CachedNetworkImage {
  AppCachedImage({
    super.key, 
    required super.imageUrl,
  }): super(
    fit: BoxFit.fill,
    fadeInDuration: Duration.zero,
    errorWidget:(context, url, error) {
       return Container(
          width: double.maxFinite,
          color: AppColor.grey100,
          child: Icon(Icons.error, color: AppColor.whiteColor,),
        );
    },
  );
}