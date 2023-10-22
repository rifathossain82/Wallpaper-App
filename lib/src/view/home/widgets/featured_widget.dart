import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/src/core/enums/app_enum.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/featured_item_widget.dart';
import 'package:wallpaper_app/src/view_model/home/home_state.dart';

class FeaturedWidget extends ConsumerWidget {
  final HomeState homeState;

  const FeaturedWidget({
    Key? key,
    required this.homeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredItemHeight = context.screenHeight * 0.15;
    final featuredItemWidth = context.screenHeight * 0.24;
    return homeState.featuredStatus == Status.loading
        ? const Text('Loading')
        : homeState.featuredList.isEmpty
            ? const SizedBox()
            : Column(
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
                      itemCount: homeState.featuredList.length,
                      itemBuilder: (context, index) => FeaturedItemWidget(
                        itemWidth: featuredItemWidth,
                        featuredData: homeState.featuredList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                    ),
                  ),
                ],
              );
  }
}
