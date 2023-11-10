import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  final IconData icon;
  final bool isPressed;
  final double size;

  const CustomButtonAppBar({
    Key? key,
    required this.textbutton,
    required this.icon,
    required this.onPressed,
    required this.isPressed,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 0,
      height: size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isPressed ? AppColor.primaryColor: AppColor.grey,
            size: size * 0.4,
          ),
          SizedBox(height: 4),
          Text(
            textbutton,
            style: TextStyle(
              color: isPressed ? AppColor.primaryColor: AppColor.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
