import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class WallpaperItemWidget extends StatelessWidget {
  final String imgUrl;

  const WallpaperItemWidget({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageBuilder(
      imgURl: imgUrl,
      borderRadius: BorderRadius.circular(8),
      fit: BoxFit.cover,
    );
  }
}
