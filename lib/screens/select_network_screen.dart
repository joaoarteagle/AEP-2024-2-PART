// lib/screens/select_network_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SelectNetworkScreen extends StatelessWidget {
  final List<String> networks = ["0", "1"]; // Identificadores das redes disponíveis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selecione a Rede")),
      body: ListView.builder(
        itemCount: networks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Rede ${networks[index]}"),
            onTap: () {
              // Navega para a tela de monitoramento com a rede selecionada
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(networkId: networks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
