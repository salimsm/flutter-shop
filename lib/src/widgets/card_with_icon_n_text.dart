import 'package:flutter/material.dart';

class CardWithIconNText extends StatelessWidget {
  const CardWithIconNText(
      {Key? key, this.icon, this.text, this.padding = 4, this.margin = 0})
      : super(key: key);

  final IconData? icon;
  final String? text;
  final double padding;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(margin),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon!=null)Icon(
              icon,
              color: Colors.yellow,
            ),
            if(text!=null)Text('$text'),
          ],
        ),
      ),
    );
  }
}
