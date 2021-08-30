import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double? minHeight;
  final double? maxHeight;
  final Widget? child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight ?? 0.0;

  @override
  double get minExtent => minHeight ?? 0.0;

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) => false;
}