import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  static NavigationService get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get currentState => navigatorKey.currentState!;

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  static void pop({dynamic result}) => currentState.pop(result);

  static Future? push(Widget nextPage) => currentState.push(
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  static Future? pushReplacement(Widget nextPage) =>
      currentState.pushReplacement(
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  static Future? pushAndRemoveUntil(Widget nextPage) =>
      currentState.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
        (route) => false,
      );

  static Future? pushNamed({
    required String routeName,
    dynamic arguments,
  }) =>
      currentState.pushNamed(
        routeName,
        arguments: arguments,
      );

  static Future? pushReplacementNamed({
    required String routeName,
    dynamic arguments,
  }) =>
      currentState.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  static Future? pushNamedAndRemoveUntil({
    required String routeName,
    dynamic arguments,
  }) =>
      currentState.pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );
}
