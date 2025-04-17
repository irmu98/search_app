import 'package:flutter/material.dart';
import 'package:search_app/core/color_styles.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String value) onValueChange;

  const SearchWidget({super.key, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('textField'),
      onChanged: (text) => onValueChange(text),
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(
            vertical: 16, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorStyles.searchBar, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorStyles.searchBarFocus, width: 1.5),
        ),
      ),
    );
  }
}
