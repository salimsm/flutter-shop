import 'package:flutter/material.dart';

import '../const/colors/colors.dart';

class CustomIcon extends StatelessWidget {
  final IconData name;
  Color? iconColor=AppColor.kBlack;
  Color? cardBackgroundColor = AppColor.kBackground;
  final Function()? onTap; 
  CustomIcon({required this.name,this.iconColor,this.cardBackgroundColor,this.onTap,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: cardBackgroundColor,
          margin: const EdgeInsets.all(8),
          child: Icon(
            name,
            size: 40,
            color: iconColor,
          )),
    );
  }
}
