import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wallpaper_app/src/core/di/injection_container.dart';
import 'package:wallpaper_app/src/core/routes/routes.dart';
import 'package:wallpaper_app/src/core/theme/app_theme.dart';
import 'package:wallpaper_app/src/core/utils/app_constants.dart';
import 'package:wallpaper_app/src/core/widgets/k_scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /// Set preferred orientations to portrait only
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  /// injection container
  await init();

  /// local storage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: KScrollBehavior(),
          child: child!,
        );
      },
      navigatorKey: sl.get<GlobalKey<NavigatorState>>(),
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.darkTheme,
      initialRoute: RouteGenerator.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      scaffoldMessengerKey: sl.get<GlobalKey<ScaffoldMessengerState>>(),
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
