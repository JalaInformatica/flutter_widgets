import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_text_style.dart';

class AppIcon extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  final int? badgeCount;

  AppIcon({
    required this.onPressed,
    required this.icon,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          onPressed: onPressed,
          icon: icon,
        ),
        if (badgeCount != null && badgeCount! > 0)
          Positioned(
            right: 0,
            top: -4,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              child: Text(
                badgeCount.toString(),
                style: AppTextStyle.textXxsStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
      ],
    );
  }
}
