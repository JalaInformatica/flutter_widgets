import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/theme/app_color.dart';

class AppImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final double? radius;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? backgroundColor;
  final Border? border;
  final EdgeInsets? padding;
  final BoxShape? shape;

  const AppImage({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    this.radius,
    this.borderRadius,
    this.color,
    this.backgroundColor,
    this.padding,
    this.shape,
    this.border
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        fadeOutDuration: Duration.zero,
        fadeInDuration: Duration.zero,
        imageUrl: imageUrl,
        maxWidthDiskCache: width.toInt(), 
        maxHeightDiskCache: height.toInt(),
        imageBuilder: (context, imageProvider) => Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: shape ?? BoxShape.rectangle,
          border: border,
          borderRadius: shape==null? borderRadius ?? BorderRadius.circular(radius ?? 0) : null,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
          color: color, 
          colorBlendMode: BlendMode.srcIn,
        )),
        placeholder: (context, url) => SvgPicture.asset(
          'assets/logo-only-pink.svg',
          color: AppColor.grey100,
        ),
        errorWidget: (context, url, error) => SvgPicture.asset(
          'assets/logo-only-pink.svg',
          color: AppColor.grey100,
        ),
      ),
    );
  }
}
