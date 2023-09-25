import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/popular_collections_item_widget.dart';

class PopularCollectionsWidget extends StatelessWidget {
  const PopularCollectionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularItemHeight = context.screenHeight * 0.25;
    final popularItemWidth = context.screenHeight * 0.16;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KTitleWidget(
          text: 'Popular Collections',
          padding: EdgeInsets.only(
            top: 20,
            bottom: 5,
            left: 8,
            right: 8,
          ),
        ),
        SizedBox(
          height: popularItemHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            itemCount: 15,
            itemBuilder: (context, index) => PopularCollectionsItemWidget(
              itemWidth: popularItemWidth,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 4),
          ),
        ),
      ],
    );
  }
}
