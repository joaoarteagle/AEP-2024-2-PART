// network_recommendations.dart

class NetworkRecommendations {
  // Função para gerar recomendações com base nas atividades detectadas
  static List<String> generateRecommendations(List<Map<String, dynamic>> devices) {
    List<String> recommendations = [];

    for (var device in devices) {
      // Verifica pico de tráfego
      if (device['dataTransferred'] > 400) {
        recommendations.add(
          "Pico de tráfego detectado no dispositivo ${device['device']} (${device['ip']}). "
          "Recomendação: Verifique downloads em andamento e apps de streaming. "
          "Execute um antivírus se a atividade suspeita continuar."
        );
      }

      // Verifica dispositivos desconhecidos
      if (device['device'] == "Desconhecido") {
        recommendations.add(
          "Dispositivo desconhecido detectado na rede (${device['ip']}). "
          "Recomendação: Confirme se é um dispositivo autorizado. "
          "Caso contrário, altere a senha do Wi-Fi para reforçar a segurança."
        );
      }

      // Verifica conexões incomuns
      if (device['connections'].isEmpty) {
        recommendations.add(
          "Conexões incomuns detectadas para o dispositivo ${device['device']} (${device['ip']}). "
          "Recomendação: Confirme os dispositivos conectados e reconfigure permissões, se necessário."
        );
      }
    }
    return recommendations;
  }
}
