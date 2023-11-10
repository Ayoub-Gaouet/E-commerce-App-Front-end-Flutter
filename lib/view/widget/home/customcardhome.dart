import 'package:flutter/material.dart';

class CustomCardHome extends StatelessWidget{
  final String title;
  final String subtitle;
  const CustomCardHome({Key? key, required this.title, required this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical:20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF324A98),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "$title\n"),
            TextSpan(
              text: subtitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}