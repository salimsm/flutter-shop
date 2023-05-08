import 'package:flutter/material.dart';

import '../const/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPress,
      this.icon,
      this.text,
      this.width = double.maxFinite,
      this.height = 40,
      this.padding})
      : super(key: key);
  final Function() onPress;
  final IconData? icon;
  final String? text;
  final double width;
  final double height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
              fixedSize: Size(width, height), primary: AppColor.kPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon),
              if (text != null)
                Text(
                  text!,
                  style: const TextStyle(fontSize: 17),
                ),
            ],
          )),
    );
  }
}
