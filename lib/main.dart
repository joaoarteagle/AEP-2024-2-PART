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
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent,
          surface: Color(0xFF1E1E1E),
          background: Colors.black,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1B1B1B),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.grey[300]),
          bodyMedium: TextStyle(color: Colors.grey[500]),
        ),
        iconTheme: IconThemeData(color: Colors.blueAccent),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.black,
        ),
      ),
      home: SelectNetworkScreen(),
    );
  }
}
