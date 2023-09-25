import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImageBuilder(
            imgURl:
                'https://images.pexels.com/photos/2379653/pexels-photo-2379653.jpeg?cs=srgb&dl=pexels-david-bartus-2379653.jpg&fm=jpg',
            borderRadius: BorderRadius.circular(8),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Text(
            'Love',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
