import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// to check internet connection, it return bool type value
Future<bool> get hasInternet async {
  var result = await (Connectivity().checkConnectivity());
  if (result == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

/// to send request in server with async system we use the run method of DeBouncer class
class DeBouncer {
  int? milliseconds;
  VoidCallback? action;
  static Timer? timer;

  static run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

/// to print in console when app is only debug mode
void kPrint(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
}
