import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';
import 'package:wallpaper_app/src/view/category/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KTitleWidget(
          text: 'Categories',
          padding: EdgeInsets.only(
            top: 25,
            bottom: 5,
            left: 8,
            right: 8,
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 9 / 4,
          ),
          itemCount: 50,
          itemBuilder: (context, index) => const CategoryItemWidget(),
        ),
      ],
    );
  }
}
