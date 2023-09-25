import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/di/injection_container.dart';

class SnackBarService {
  static void showSnackBar({
    required String message,
    required Color bgColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: bgColor,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    );
    sl.get<GlobalKey<ScaffoldMessengerState>>().currentState?.hideCurrentSnackBar();
    sl.get<GlobalKey<ScaffoldMessengerState>>().currentState?.showSnackBar(snackBar);
    // ScaffoldMessenger.of(sl<GlobalKey<NavigatorState>>().currentContext!)
    //     .showSnackBar(
    //   snackBar,
    // );
  }
}
