import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/enums/app_enum.dart';
import 'package:wallpaper_app/src/core/widgets/failure_widget_builder.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';
import 'package:wallpaper_app/src/core/widgets/shimmer_grid_view_widget.dart';
import 'package:wallpaper_app/src/core/widgets/wallpapers_grid_view_widget.dart';
import 'package:wallpaper_app/src/view_model/home/home_state.dart';

class WallpapersWidget extends StatelessWidget {
  final HomeState homeState;

  const WallpapersWidget({
    Key? key,
    required this.homeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KTitleWidget(
          text: 'Wallpapers',
          padding: EdgeInsets.only(
            top: 25,
            bottom: 5,
            left: 8,
            right: 8,
          ),
        ),
        homeState.wallpaperStatus == Status.loading
            ? const ShimmerGridViewWidget()
            : homeState.wallpaperStatus == Status.failure
                ? const FailureWidgetBuilder()
                : WallpapersGridViewWidget(
                    hasReachedMax: homeState.hasReachedMax,
                    photoList: homeState.photoList,
                  ),
      ],
    );
  }
}
