import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/widgets/wallpapers_grid_view_widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WallpapersGridViewWidget(
      shrinkWrap: false,
      physics: AlwaysScrollableScrollPhysics(),
      hasReachedMax: false,
      photoList: [],
    );
  }
}
