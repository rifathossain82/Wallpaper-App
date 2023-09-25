import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class PopularCollectionsItemWidget extends StatelessWidget {
  final double itemWidth;

  const PopularCollectionsItemWidget({
    Key? key,
    required this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          CachedNetworkImageBuilder(
            imgURl:
                'https://i.pinimg.com/1200x/f3/21/fa/f321fa117ef5bf566ab54ff7be7992a3.jpg',
            borderRadius: BorderRadius.circular(8),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 5,
            left: 5,
            right: 10,
            child: Text(
              'Dark Abstracts',
              maxLines: 3,
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
