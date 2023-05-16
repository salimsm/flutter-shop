import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/pages/login_page.dart';
import 'package:flutter_project_10/src/provider/cartProvider/cart_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
