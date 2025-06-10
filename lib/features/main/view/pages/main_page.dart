import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black12,
          type: BottomNavigationBarType.fixed,
          items:<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label:"home"),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label:"categories"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"card"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_outlined),label:"orders"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:"profile"),
      ]
      ),
    );
  }
}
