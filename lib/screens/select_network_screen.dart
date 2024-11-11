import 'package:flutter/material.dart';
import 'home_screen.dart';

class SelectNetworkScreen extends StatelessWidget {
  final List<String> networks = [
    "NET-ESCRITÓRIO",
    "INTERNET-CASA",
    "NET-EDUARDO",
    "NET-JOAO",
    "NET-PEDRO",
    "UNICESUMAR ACAD",
    "UNICESUMAR Visitantes"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione a Rede"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: ListView.builder(
        itemCount: networks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(
                Icons.wifi,
                color: Colors.blue[800],
                size: 30,
              ),
              title: Text(
                "Rede: ${networks[index]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.blueGrey[200]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(networkId: networks[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
