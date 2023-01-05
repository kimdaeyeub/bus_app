import 'package:bus_app/screens/check_screen.dart';
import 'package:bus_app/screens/home_screen.dart';
import 'package:bus_app/screens/search_screen.dart';
import 'package:bus_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
    
  List pages = [
    HomeScreen(),
    SearchScreen(),
    CheckScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Bus',
          style: TextStyle(
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label:'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.checklist),label:'Check'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded),label:'Setting'),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
