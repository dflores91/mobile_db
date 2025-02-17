import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: gray5,
      highlightColor: yellow,
      child: child,
    );
  }
}
