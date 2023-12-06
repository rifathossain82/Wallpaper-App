import 'package:flutter/material.dart';

class SnackBarService {
  static final SnackBarService _instance = SnackBarService._internal();

  static SnackBarService get instance => _instance;

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static ScaffoldMessengerState get currentState =>
      scaffoldMessengerKey.currentState!;

  factory SnackBarService() {
    return instance;
  }

  SnackBarService._internal();

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
    currentState.hideCurrentSnackBar();
    currentState.showSnackBar(snackBar);
  }
}
