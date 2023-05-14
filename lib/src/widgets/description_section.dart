import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection(
      {Key? key, required this.descriptionTitle, required this.descriptionBody})
      : super(key: key);
  final String descriptionTitle;
  final String descriptionBody;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          descriptionTitle,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              descriptionBody,
              style: const TextStyle(
                fontSize: 14,
              ),
            ))
      ],
    );
  }
}
