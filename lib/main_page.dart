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
    //HomeScreen(),
    SearchScreen(),
    CheckScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        //color: Colors.grey.withOpacity(0.2),
        elevation: 0,
        title: Text(
          'Bus',
          style: TextStyle(
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          //BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.checklist),label:'Check'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded),label:'Setting'),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
