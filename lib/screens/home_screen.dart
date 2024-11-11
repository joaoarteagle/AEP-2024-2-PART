import 'package:flutter/material.dart';
import '../services/network_service.dart';
import '../utils/network_recommendations.dart';

class HomeScreen extends StatefulWidget {
  final String networkId;

  HomeScreen({required this.networkId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NetworkService _networkService = NetworkService();
  List<Map<String, dynamic>> _networkData = [];
  List<String> _alerts = [];
  List<String> _recommendations = [];

  @override
  void initState() {
    super.initState();
    _loadNetworkData();
  }

  Future<void> _loadNetworkData() async {
    try {
      List<dynamic> data =
          await _networkService.fetchNetworkData(widget.networkId);
      setState(() {
        _networkData = data.cast<Map<String, dynamic>>();
      });
      _detectSuspiciousActivity(_networkData);
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }

  void _detectSuspiciousActivity(List<Map<String, dynamic>> devices) {
    List<String> alerts = [];
    for (var device in devices) {
      if (device['dataTransferred'] > 400) {
        alerts.add(
            "Pico de tráfego detectado no dispositivo ${device['device']} (${device['ip']}).");
      }
      // outros alertas omitidos para brevidade
    }

    List<String> recommendations =
        NetworkRecommendations.generateRecommendations(devices);
    setState(() {
      _alerts = alerts;
      _recommendations = recommendations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoramento de Rede - ${widget.networkId}'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeviceList(),
              const SizedBox(height: 20),
              _buildSectionHeader(
                  "Alertas de Atividades Suspeitas", Colors.redAccent),
              const SizedBox(height: 10),
              _buildAlertsList(),
              const SizedBox(height: 20),
              _buildSectionHeader("Recomendações", Colors.blueAccent),
              const SizedBox(height: 10),
              _buildRecommendationsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceList() {
    return Column(
      children: _networkData.map((device) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: Icon(Icons.devices, color: Colors.blue[800], size: 30),
            title: Text('${device['device']} (${device['ip']})',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle:
                Text('Dados transferidos: ${device['dataTransferred']} MB'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Colors.blueGrey[200], size: 18),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Row(
      children: [
        Icon(Icons.info, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }

  Widget _buildAlertsList() {
    if (_alerts.isEmpty) {
      return Center(
          child: Text("Nenhum alerta detectado.",
              style: TextStyle(color: Colors.grey[600])));
    }
    return Column(
      children: _alerts.map((alert) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.red[50],
          child: ListTile(
            leading: Icon(Icons.warning, color: Colors.redAccent),
            title: Text(alert, style: TextStyle(color: Colors.red[900])),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecommendationsList() {
    if (_recommendations.isEmpty) {
      return Center(
          child: Text("Nenhuma recomendação disponível.",
              style: TextStyle(color: Colors.grey[600])));
    }
    return Column(
      children: _recommendations.map((recommendation) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.blue[50],
          child: ListTile(
            leading: Icon(Icons.check_circle, color: Colors.blueAccent),
            title:
                Text(recommendation, style: TextStyle(color: Colors.blue[900])),
          ),
        );
      }).toList(),
    );
  }
}
