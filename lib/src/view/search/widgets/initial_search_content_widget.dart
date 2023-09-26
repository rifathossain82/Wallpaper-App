import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/cached_network_image_builder.dart';
import 'package:wallpaper_app/src/core/widgets/k_title_widget.dart';

class InitialSearchContentWidget extends StatelessWidget {
  const InitialSearchContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double availableSearchItemSize = 80;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KTitleWidget(
          text: 'People available search',
          padding: EdgeInsets.only(
            top: 10,
            left: 8,
            right: 8,
            bottom: 8,
          ),
        ),
        SizedBox(
          height: availableSearchItemSize,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            itemCount: 15,
            itemBuilder: (context, index) => _AvailableSearchItemWidget(
              itemSize: availableSearchItemSize,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 4),
          ),
        )
      ],
    );
  }
}

class _AvailableSearchItemWidget extends StatelessWidget {
  final double itemSize;

  const _AvailableSearchItemWidget({
    Key? key,
    required this.itemSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImageBuilder(
            imgURl:
                'https://images.pexels.com/photos/2379653/pexels-photo-2379653.jpeg?cs=srgb&dl=pexels-david-bartus-2379653.jpg&fm=jpg',
            borderRadius: BorderRadius.circular(100),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Text(
            'Fall',
            maxLines: 1,
            textAlign: TextAlign.start,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
