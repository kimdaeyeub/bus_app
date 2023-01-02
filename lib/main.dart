import 'package:bus_app/screens/home_screen.dart';
import 'package:bus_app/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  ApiServices().getBusStation();
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
