import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.color,
    required this.child,
    required this.onPressed,
    this.minumumSize = const Size(150, 54),
    super.key,
  });

  final Color color;
  final Widget child;
  final void Function() onPressed;
  final Size minumumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: minumumSize,
        padding: EdgeInsets.symmetric(horizontal: size16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
