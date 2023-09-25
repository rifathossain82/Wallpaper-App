import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/view/home/widgets/featured_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/popular_collections_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/slider_widget.dart';
import 'package:wallpaper_app/src/core/widgets/wallpapers_grid_view_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/wallpapers_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FeaturedWidget(),
          SliderWidget(),
          PopularCollectionsWidget(),
          WallpapersWidget(),
        ],
      ),
    );
  }
}
