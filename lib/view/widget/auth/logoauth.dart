import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logoAuth,
      width: 150,
      height: 150,
    );
  }
}