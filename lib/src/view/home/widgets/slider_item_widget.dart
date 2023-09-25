import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class SliderItemWidget extends StatelessWidget {
  final String imgUrl;

  const SliderItemWidget({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CachedNetworkImageBuilder(
        imgURl: imgUrl,
        borderRadius: BorderRadius.circular(8),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
