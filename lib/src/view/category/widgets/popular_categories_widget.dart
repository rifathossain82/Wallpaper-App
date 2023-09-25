import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';
import 'package:wallpaper_app/src/view/category/widgets/popular_category_item_widget.dart';

class PopularCategoriesWidget extends StatelessWidget {
  const PopularCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularCategoryItemSize = context.screenHeight * 0.14;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KTitleWidget(
          text: 'Popular Categories',
          padding: EdgeInsets.only(
            top: 20,
            bottom: 8,
            left: 8,
            right: 8,
          ),
        ),
        SizedBox(
          height: popularCategoryItemSize,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            itemCount: 15,
            itemBuilder: (context, index) => PopularCategoryItemWidget(
              itemWidth: popularCategoryItemSize,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 4),
          ),
        ),
      ],
    );
  }
}
