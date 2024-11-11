import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<List<dynamic>> fetchNetworkData(String networkId) async {
    final response = await http.get(Uri.parse('http://192.168.1.14:3000/$networkId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erro ao carregar dados da rede $networkId");
    }
  }

  // Função para detectar atividades suspeitas
  void detectSuspiciousActivity(List<dynamic> devices) {
    for (var device in devices) {
      // Verifica pico de tráfego
      if (device['dataTransferred'] > 400) { // Limiar para pico de tráfego
        _sendAlert("Alerta: Pico de tráfego detectado no dispositivo ${device['device']} (${device['ip']}).");
      }

      // Verifica conexões para IPs desconhecidos
      for (var ip in device['connections']) {
        if (!_isKnownIP(ip, devices)) {
          _sendAlert("Alerta: Conexão suspeita do dispositivo ${device['device']} (${device['ip']}) para IP desconhecido: $ip.");
        }
      }
    }
  }

  // Função para verificar se um IP está na rede
  bool _isKnownIP(String ip, List<dynamic> devices) {
    return devices.any((device) => device['ip'] == ip);
  }

  // Função de alerta (pode ser modificada para exibir notificações no app)
  void _sendAlert(String message) {
    print(message); // Exibe o alerta no console (pode ser substituído por uma notificação)
  }
}
