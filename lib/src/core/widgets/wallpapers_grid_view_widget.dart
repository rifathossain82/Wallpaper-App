import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/widgets/wallpaper_item_widget.dart';

class WallpapersGridViewWidget extends StatelessWidget {
  const WallpapersGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1/2,
      ),
      itemCount: 50,
      itemBuilder: (context, index) => const WallpaperItemWidget(),
    );
  }
}
