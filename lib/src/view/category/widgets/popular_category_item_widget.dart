import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class PopularCategoryItemWidget extends StatelessWidget {
  final double itemWidth;

  const PopularCategoryItemWidget({
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
        alignment: Alignment.center,
        children: [
          CachedNetworkImageBuilder(
            imgURl: 'https://i.pinimg.com/736x/28/d3/83/28d3837232911297b40210071de67297--storyboard-character-inspiration.jpg',
            borderRadius: BorderRadius.circular(8),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            width: itemWidth,
            decoration: BoxDecoration(
              color: kBlackLight.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Text(
            'Anime',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              color: kWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
