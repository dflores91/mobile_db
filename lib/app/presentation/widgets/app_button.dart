import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.color,
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Color color;
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(150, size54),
        padding: EdgeInsets.symmetric(horizontal: size16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
