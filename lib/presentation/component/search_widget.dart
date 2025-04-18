import 'package:flutter/material.dart';
import 'package:search_app/core/ui/color_styles.dart';

class SearchWidget extends StatelessWidget {
  final void Function(String value) onValueChange;

  final TextEditingController controller = TextEditingController();

  SearchWidget({super.key, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            key: const Key('textField'),
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: ColorStyles.searchHintTextColor,
                fontSize: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorStyles.searchBar,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorStyles.searchBar,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  onValueChange(controller.text);
                },
                icon: Icon(
                  Icons.search,
                  color: ColorStyles.searchBar,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}
