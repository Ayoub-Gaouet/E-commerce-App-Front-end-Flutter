import 'package:flutter/material.dart';

class SimilarProductDetails extends StatelessWidget {
  SimilarProductDetails( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: 6),
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Image.network("https://t3.ftcdn.net/jpg/00/79/36/04/240_F_79360425_13tH0FGR7nYTNlXWKOWtLmzk7BAikO1b.jpg",
              height: 70,
            ),
          ),
        ),
      ),
    );
  }
}