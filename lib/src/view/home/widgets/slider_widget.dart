import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/widgets/carousel_slider_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/slider_indicator_widget.dart';
import 'package:wallpaper_app/src/view/home/widgets/slider_item_widget.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      alignment: Alignment.center,
      width: context.screenWidth,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          CarouselSliderWidget(
            onPageChanged: (index, reason) {
              setState(() {
                sliderIndex = index;
              });
            },
            items: const [
              'https://smartslider3.com/wp-content/uploads/2019/05/sliderimages-780x410.png',
              'https://www.sectorlink.com/img/blog/wordpress-slider.png',
              'https://soliloquywp.com/wp-content/uploads/2017/10/fullwidth-image-slider-in-wordpress.jpg',
            ],
            builder: (item) => SliderItemWidget(imgUrl: item),
          ),
          Positioned(
            bottom: 10,
            child: SliderIndicatorWidget(
              length: 3,
              currentIndex: sliderIndex,
            ),
          ),
        ],
      ),
    );
  }
}
