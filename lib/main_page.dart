import 'package:bus_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

    
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
      body: SearchScreen(),
    );
  }
}
