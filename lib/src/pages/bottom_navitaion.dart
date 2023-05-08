import 'package:flutter/material.dart';

import '../const/colors/colors.dart';
import '../const/string/string.dart';
import '../utils/navigation/navitaion.dart';
import '../common/custom_button.dart';
import '../common/custom_text_form_field.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      body: Center(
        child: Text('hello')
      ),
    );
  }
}
