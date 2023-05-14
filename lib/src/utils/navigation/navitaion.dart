import 'package:flutter/material.dart';

navigateTo(BuildContext context, Widget nextPage) {
  return Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextPage));
}

navigateBackTo(BuildContext context) {
  Navigator.of(context).pop();
}

navigateWithReplacementTo(BuildContext context, Widget nextPage) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => nextPage));
}
