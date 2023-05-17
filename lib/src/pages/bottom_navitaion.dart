import 'package:flutter/material.dart';
import 'package:flutter_project_10/src/provider/cartProvider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'pages.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List pageList = [
    const MainPage(),
    const CategoryPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Category'),
          BottomNavigationBarItem(
              icon: Stack(children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.0),
                  child: Icon(Icons.shopping_cart),
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Consumer<CartProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                          // padding:EdgeInsets.all(4)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              value.totalQuantity.toString(),
                              // style: TextStyle(backgroundColor: Colors.blue),
                            ),
                          ),
                        );
                      },
                    ))
              ]),
              label: 'Cart'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Setting'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        currentIndex: _selectedIndex,
        onTap: onTapped,
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
