import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
      child: TextField(
          cursorHeight: 10,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              fillColor: Colors.white,
              filled: true,
              focusColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search for over 5000 product',
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
    );
  }
}
