import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/featured_item_widget.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final featuredItemHeight = context.screenHeight * 0.15;
    final featuredItemWidth = context.screenHeight * 0.24;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KTitleWidget(
          text: 'Featured',
          padding: EdgeInsets.only(
            top: 20,
            bottom: 5,
            left: 8,
            right: 8,
          ),
        ),
        SizedBox(
          height: featuredItemHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            itemCount: 15,
            itemBuilder: (context, index) => FeaturedItemWidget(
              itemWidth: featuredItemWidth,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 4),
          ),
        ),
      ],
    );
  }
}
