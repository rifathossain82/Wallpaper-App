import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class FeaturedItemWidget extends StatelessWidget {
  final double itemWidth;

  const FeaturedItemWidget({
    Key? key,
    required this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CachedNetworkImageBuilder(
            imgURl: 'https://images.pexels.com/photos/2379653/pexels-photo-2379653.jpeg?cs=srgb&dl=pexels-david-bartus-2379653.jpg&fm=jpg',
            borderRadius: BorderRadius.circular(8),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Text(
              'Fall Season ',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: context.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
