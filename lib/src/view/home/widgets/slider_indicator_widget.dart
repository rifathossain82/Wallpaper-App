import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';

class SliderIndicatorWidget extends StatelessWidget {
  final int length;
  final int currentIndex;

  const SliderIndicatorWidget({
    Key? key,
    required this.length,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.screenWidth,
      alignment: Alignment.center,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (context, int index) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: currentIndex == index ? 18 : 6,
                height: 6,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    currentIndex == index ? 15 : 30,
                  ),
                  color: currentIndex == index ? kDeepOrange : kGreyLight,
                ),
              ),
            );
          }),
    );
  }
}
