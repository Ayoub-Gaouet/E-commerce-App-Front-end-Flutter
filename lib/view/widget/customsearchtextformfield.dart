import 'package:flutter/material.dart';


class CustomSearchTextFormField extends StatelessWidget {
  final void Function()? onPressedSearch;
  final String titleappbar;
  final Function(String)? onChanged;
  final TextEditingController? mycontroller;
  const CustomSearchTextFormField({Key? key, required this.titleappbar, this.onPressedSearch, this.onChanged, this.mycontroller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: mycontroller,
        onChanged:onChanged,
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
