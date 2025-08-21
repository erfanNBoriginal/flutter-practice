import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class SearchInput extends StatefulWidget {
  //
  final String hintText;

  final bool autoFocus;

  final bool isSearched;

  final void Function() onSearched;

  final TextEditingController controller;

  const SearchInput({
    super.key,
    this.hintText = 'جستجو',
    this.autoFocus = false,
    this.isSearched = false,
    required this.controller,
    required this.onSearched,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  //
  bool isFocused = false;

  late bool textIsEmpty;

  final focusNode = FocusNode();

  String lastSearch = '';

  @override
  void initState() {
    if (widget.autoFocus) {
      focusNode.requestFocus();
    }
    textIsEmpty = widget.controller.text.isEmpty;
    widget.controller.addListener(() {
      textIsEmpty = widget.controller.text.isEmpty;
      if (textIsEmpty && widget.isSearched) {
        onSearch();
      }
      setState(() {});
    });
    focusNode.addListener(() {
      isFocused = focusNode.hasFocus;
      setState(() {});
    });
    super.initState();
  }

  void onSearch() {
    if (lastSearch != widget.controller.text) {
      lastSearch = widget.controller.text;
      widget.onSearched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: U.Theme.surface,
          borderRadius: BorderRadius.circular(U.Theme.r15),
          border: Border.all(
            width: 1,
            color: isFocused ? U.Theme.primary : Colors.transparent,
          ),
        ),
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 14,
          bottom: 14,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onSearch,
              child: U.Image.icon(
                size: 24,
                path: U.Icons.search,
                color: U.Theme.secondary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                onEditingComplete: onSearch,
                controller: widget.controller,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'IranSans',
                  color: U.Theme.secondary,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: U.Theme.secondary,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IranSans',
                    color: U.Theme.outline2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            if (!textIsEmpty) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => widget.controller.clear(),
                child: U.Image.icon(
                  size: 24,
                  path: U.Icons.clear,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
