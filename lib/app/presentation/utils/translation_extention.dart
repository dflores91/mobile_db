import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

extension TranslateExtension on String {
  String tr(BuildContext context, {Map<String, String>? translationParams}) {
    return FlutterI18n.translate(
      context,
      this,
      translationParams: translationParams,
    );
  }
}
