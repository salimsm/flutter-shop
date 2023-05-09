import 'package:flutter/material.dart';

import '../const/const.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: AppString.homePageTitle,
        trailingIcon: Icons.search,
        trailingIconOnPress:(){navigateTo(context,SearchPage())},
      ),
      body: Center(
        child: Text('MainPage'),
      ),
    );
  }
}
