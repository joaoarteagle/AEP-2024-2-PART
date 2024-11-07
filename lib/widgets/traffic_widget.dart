import 'package:flutter/material.dart';

class TrafficWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Tráfego de Rede"),
        subtitle: Text("Dados de tráfego em tempo real"),
      ),
    );
  }
}
