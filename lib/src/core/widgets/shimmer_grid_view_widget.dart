import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/widgets/k_shimmer_container.dart';
import 'package:wallpaper_app/src/core/widgets/wallpaper_item_widget.dart';

class ShimmerGridViewWidget extends StatelessWidget {
  final ScrollPhysics physics;
  final bool shrinkWrap;

  const ShimmerGridViewWidget({
    Key? key,
    this.physics = const NeverScrollableScrollPhysics(),
    this.shrinkWrap = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1 / 2,
      ),
      itemCount: 30,
      itemBuilder: (context, index) => const KShimmerContainer(
        borderRadius: 8,
      ),
    );
  }
}
