import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/di/injection_container.dart';

class NavigationService {
  static final NavigatorState? _navigatorState = sl.get<GlobalKey<NavigatorState>>().currentState;

  static void pop({dynamic result}) => _navigatorState?.pop(result);

  static Future? push(Widget nextPage) => _navigatorState?.push(
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  static Future? pushReplacement(Widget nextPage) =>
      _navigatorState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
      );

  static Future? pushAndRemoveUntil(Widget nextPage) =>
      _navigatorState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => nextPage,
        ),
        (route) => false,
      );

  static Future? pushNamed({
    required String routeName,
    dynamic arguments,
  }) =>
      _navigatorState?.pushNamed(
        routeName,
        arguments: arguments,
      );

  static Future? pushReplacementNamed({
    required String routeName,
    dynamic arguments,
  }) =>
      _navigatorState?.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  static Future? pushNamedAndRemoveUntil({
    required String routeName,
    dynamic arguments,
  }) =>
      _navigatorState?.pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );
}
