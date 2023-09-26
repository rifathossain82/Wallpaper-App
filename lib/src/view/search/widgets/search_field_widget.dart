import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool hasText;
  final ValueChanged onChanged;
  final VoidCallback onClose;

  const SearchFieldWidget({
    Key? key,
    required this.controller,
    required this.hasText,
    required this.onChanged,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: 1,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 8,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: kWhite.withOpacity(0.1),
          hintText: 'Search here',
          isDense: true,
          suffixIcon: hasText
              ? IconButton(
                  icon: Icon(
                    CupertinoIcons.clear_circled_solid,
                    size: 20,
                    color: kWhite,
                  ),
                  onPressed: onClose,
                )
              : Icon(
                  Icons.search,
                  size: 20,
                  color: kGreyMedium,
                ),
        ),
      ),
    );
  }
}
