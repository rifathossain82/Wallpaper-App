import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/src/view/home/widgets/featured_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/popular_collections_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/slider_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/wallpapers_widget.dart';
import 'package:wallpaper_app/src/view_model/home/home_provider.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    ref.read(homeProvider.notifier)..getFeaturedList()..getWallpaperList(reload: true);

    scrollIndicator();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollIndicator() {
    _scrollController.addListener(
      () {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          if (!ref.watch(homeProvider).hasReachedMax) {
            ref.read(homeProvider.notifier).getWallpaperList();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          FeaturedWidget(
            homeState: homeState,
          ),
          SliderWidget(),
          PopularCollectionsWidget(),
          WallpapersWidget(
            homeState: homeState,
          ),
        ],
      ),
    );
  }
}
