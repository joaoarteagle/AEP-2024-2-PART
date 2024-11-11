// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/select_network_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoramento de Rede',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SelectNetworkScreen(),
    );
  }
 }