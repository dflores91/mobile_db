import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/navigation/navigation_service.dart';

String localeUser() {
  final context = NavigationService.navigatorKey.currentContext;
  final locale = Localizations.localeOf(context!).toString();
  return locale;
}
