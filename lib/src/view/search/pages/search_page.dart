import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/extensions/build_context_extension.dart';
import 'package:wallpaper_app/src/view/search/widgets/initial_search_content_widget.dart';
import 'package:wallpaper_app/src/view/search/widgets/search_field_widget.dart';
import 'package:wallpaper_app/src/view/search/widgets/search_result_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchTextController = TextEditingController();
  bool hasSearchText = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: SearchFieldWidget(
          controller: searchTextController,
          hasText: hasSearchText,
          onChanged: (value) {
            if (value.toString().isNotEmpty) {
              hasSearchText = true;
            } else {
              hasSearchText = false;
            }
            setState(() {});
          },
          onClose: () {
            setState(() {
              hasSearchText = false;
              searchTextController.clear();
              context.unFocusKeyboard();
            });
          },
        ),
      ),
      body: hasSearchText
          ? const SearchResultWidget()
          : const InitialSearchContentWidget(),
    );
  }
}
