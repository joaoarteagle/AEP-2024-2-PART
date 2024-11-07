import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Alertas"),
        subtitle: Text("Monitoramento de Ameaças Ativado"),
      ),
    );
  }
}
