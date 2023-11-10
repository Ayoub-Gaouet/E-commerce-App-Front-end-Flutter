import 'package:flutter/material.dart';

class SearchFieldHeader extends StatelessWidget {
  final void Function()? onPressedSearch;
  final String titleappbar;
  const SearchFieldHeader({
    Key? key, this.onPressedSearch, required this.titleappbar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: titleappbar,
          prefixIcon: IconButton(icon: Icon(Icons.search, color: Colors.grey[600]), onPressed: onPressedSearch),
        ),
      ),
    );
  }
}
