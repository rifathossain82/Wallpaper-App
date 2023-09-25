import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/routes/routes.dart';
import 'package:wallpaper_app/src/core/services/navigation_services.dart';
import 'package:wallpaper_app/src/core/utils/asset_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  setSplashDuration() async {
    return Timer(
      const Duration(seconds: 3),
      () => pageNavigation(),
    );
  }

  void pageNavigation() async {
    NavigationService.pushReplacementNamed(
      routeName: RouteGenerator.dashboard,
    );
  }

  @override
  void initState() {
    /// set duration and control what next after splash duration
    setSplashDuration();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );

    animation.addListener(() => setState(() {}));
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    /// dispose animation
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetPath.amarSolutionTextLogo,
          height: animation.value * 220,
          width: animation.value * 220,
        ),
      ),
    );
  }
}
