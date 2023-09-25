import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/view/dashboard/pages/dashboard_page.dart';
import 'package:wallpaper_app/src/view/search/pages/search_page.dart';
import 'package:wallpaper_app/src/view/splash/pages/splash_page.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String homepage = '/homepage';
  static const String search = '/search';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: routeSettings,
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: routeSettings,
        );
      case search:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
          settings: routeSettings,
        );
      // case homepage:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomePage(),
      //     settings: routeSettings,
      //   );
      // case customerSelect:
      //   return MaterialPageRoute(
      //     builder: (_) => const CustomerSelectPage(),
      //     settings: routeSettings,
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: routeSettings,
        );
    }
  }
}
