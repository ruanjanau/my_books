import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  final Widget child;
  final bool dark;
  const DefaultShimmer({
    super.key,
    required this.child,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey.shade900 : Colors.grey.shade300,
      highlightColor: dark ? Colors.grey.shade600 : Colors.grey.shade100,
      enabled: true,
      child: child,
    );
  }
}
