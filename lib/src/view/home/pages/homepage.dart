import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/view/home/widgets/featured_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/popular_collections_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/slider_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/wallpapers_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  // @override
  // void initState() {
  //   ref.read(homeProvider.notifier).getWallpaperList(reload: true);
  //
  //   scrollIndicator();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  //
  // void scrollIndicator() {
  //   _scrollController.addListener(
  //     () {
  //       if (_scrollController.offset >=
  //               _scrollController.position.maxScrollExtent &&
  //           !_scrollController.position.outOfRange) {
  //         if (!ref.watch(homeProvider).hasReachedMax) {
  //           ref.read(homeProvider.notifier).getWallpaperList();
  //         }
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
