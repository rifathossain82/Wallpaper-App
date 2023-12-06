import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallpaper_app/src/core/routes/routes.dart';
import 'package:wallpaper_app/src/core/services/navigation_services.dart';
import 'package:wallpaper_app/src/core/services/snack_bar_services.dart';
import 'package:wallpaper_app/src/core/theme/app_theme.dart';
import 'package:wallpaper_app/src/core/utils/app_constants.dart';
import 'package:wallpaper_app/src/core/widgets/k_scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /// Set preferred orientations to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Initialize Singletons.
  SnackBarService.instance;
  NavigationService.instance;

  /// local storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: KScrollBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.darkTheme,
      initialRoute: RouteGenerator.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      scaffoldMessengerKey: SnackBarService.scaffoldMessengerKey,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
