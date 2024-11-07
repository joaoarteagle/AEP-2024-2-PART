import 'package:flutter/material.dart';
import '../widgets/traffic_widget.dart';
import '../widgets/alert_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monitoramento de Rede"),
      ),
      body: Column(
        children: [
          TrafficWidget(),
          AlertWidget(),
        ],
      ),
    );
  }
}
