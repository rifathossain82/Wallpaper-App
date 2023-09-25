import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class WallpaperItemWidget extends StatelessWidget {
  const WallpaperItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageBuilder(
      imgURl: 'https://i.pinimg.com/236x/bd/35/ca/bd35caa1d66da3a15ed952b4ac1010f7.jpg',
      borderRadius: BorderRadius.circular(8),
      fit: BoxFit.cover,
    );
  }
}
