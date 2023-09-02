import 'package:flutter/material.dart';
import 'package:tut_todo/constants/colors.dart';

class SearchBar extends StatelessWidget {
  final Function(String)
      onSearchChanged; // Callback when the search text changes

  const SearchBar({required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged:
            onSearchChanged, // Call the provided callback when text changes
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search Task',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}
