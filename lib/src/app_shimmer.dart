import 'package:flutter/material.dart';
import 'package:flutter_widgets/theme/app_color.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends Shimmer {
  AppShimmer.fromColors({
    super.key,
    required super.child,
  }) : super.fromColors(
          baseColor: AppColor.grey100,
          highlightColor: AppColor.grey300,
        );

  /// Factory shimmer list
  factory AppShimmer.list({
    Key? key,
    required int count,
    required Widget Function(BuildContext, int) itemBuilder,
    Axis axis = Axis.vertical,
    double spacing = 8.0,
  }) {
    return AppShimmer.fromColors(
      key: key,
      child: Builder(
        builder: (context) {
          final children = List.generate(count, (index) {
            return Padding(
              padding: EdgeInsets.only(
                right: axis == Axis.horizontal ? spacing : 0,
                bottom: axis == Axis.vertical ? spacing : 0,
              ),
              child: itemBuilder(context, index),
            );
          });

          return axis == Axis.horizontal
              ? Row(mainAxisSize: MainAxisSize.min, children: children)
              : Column(mainAxisSize: MainAxisSize.min, children: children);
        },
      ),
    );
  }

  /// Factory shimmer grid
  /// [count] → number of shimmer items
  /// [itemBuilder] → shimmer item widget
  /// [maxCrossAxisExtent] → max width of each grid item
  /// [childAspectRatio] → aspect ratio of each item
  /// [mainAxisSpacing] / [crossAxisSpacing] → spacing in grid
  factory AppShimmer.grid({
    Key? key,
    required int count,
    required Widget Function(BuildContext, int) itemBuilder,
    double maxCrossAxisExtent = 200,
    double childAspectRatio = 2 / 3,
    double mainAxisSpacing = 15,
    double crossAxisSpacing = 15,
  }) {
    return AppShimmer.fromColors(
      key: key,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
