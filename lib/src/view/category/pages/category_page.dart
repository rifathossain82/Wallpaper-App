import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/view/category/widgets/categorise_widget.dart';
import 'package:wallpaper_app/src/view/category/widgets/category_item_widget.dart';
import 'package:wallpaper_app/src/view/category/widgets/popular_categories_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularCategoriesWidget(),
          CategoriesWidget(),
        ],
      ),
    );
  }
}
