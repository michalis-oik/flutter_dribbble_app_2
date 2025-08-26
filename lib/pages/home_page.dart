import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.brown[500], // affects both icon & label when selected
        unselectedItemColor: Colors.grey[700], // affects both when unselected
        //selectedLabelStyle: const TextStyle(color: Colors.green),    // override label color when selected
        //unselectedLabelStyle: const TextStyle(color: Colors.red),    // override label color when unselected
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),    // override label color when selected
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}