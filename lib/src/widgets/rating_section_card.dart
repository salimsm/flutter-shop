import 'package:flutter/material.dart';
import '../const/const.dart';
import 'widgets.dart';

class RatingSectionCard extends StatelessWidget {
  const RatingSectionCard({Key? key, this.rate, this.count}) : super(key: key);
  final double? rate;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardWithIconNText(icon: Icons.star, text: rate.toString()),
        const SizedBox(
          width: 4,
        ),
        // ignore: unnecessary_string_escapes
        Text('\($count ratings\)',
            style: const TextStyle(color: AppColor.kRatingText)),
      ],
    );
  }
}
