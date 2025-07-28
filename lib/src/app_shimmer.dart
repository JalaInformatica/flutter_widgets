import 'package:flutter_widgets/theme/app_color.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends Shimmer {
  AppShimmer.fromColors({
    super.key, 
    required super.child, 
  }) : super.fromColors(
    baseColor: AppColor.grey100,
    highlightColor: AppColor.grey300
  );
}