import 'package:flutter/material.dart';

import '../const/colors/colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
        margin: EdgeInsets.all(8),
        child: Icon(
          Icons.shopify_outlined,
          size: 40,
          color: AppColor.kPrimary,
        ));
  }
}
