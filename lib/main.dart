import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CyberSecurityApp());
}

class CyberSecurityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyber Security App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
