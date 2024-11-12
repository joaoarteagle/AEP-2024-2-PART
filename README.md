# Data Defender - Sistema de Monitoramento de Redes

## Visão Geral
Data Defender é um aplicativo desenvolvido em Flutter para monitoramento de segurança de redes domésticas. Ele detecta atividades suspeitas e oferece recomendações para melhorar a segurança da rede. O sistema utiliza uma arquitetura cliente-servidor com um backend simulado em JSON.

## Estrutura do Projeto
O projeto está organizado nas seguintes pastas principais:

- `lib/`: Contém todo o código do aplicativo Flutter.
  - `screens/`: Armazena as telas da aplicação.
    - `home_screen.dart`: Tela principal com o monitoramento da rede e alertas.
    - `select_network_screen.dart`: Tela de seleção de redes.
  - `services/`: Serviços para comunicação com o backend.
    - `network_service.dart`: Serviço para fazer requisições à API e detectar atividades suspeitas.
  - `utils/`: Arquivo de utilitários e lógicas específicas.
    - `network_recommendations.dart`: Geração de recomendações de segurança para os alertas detectados.

## Funcionalidades

### 1. Seleção de Redes
A `SelectNetworkScreen` permite ao usuário escolher entre redes disponíveis para monitoramento. A escolha da rede leva o usuário à tela de monitoramento correspondente.

### 2. Monitoramento da Rede
A `HomeScreen` exibe detalhes de dispositivos conectados e verifica automaticamente atividades suspeitas, gerando alertas visuais em tempo real com mensagens descritivas para cada situação.

### 3. Recomendação de Segurança
O sistema gera uma lista de recomendações personalizadas para cada tipo de atividade suspeita, orientando o usuário sobre medidas de segurança.

### 4. Comunicação com o Backend
A classe `NetworkService` envia requisições HTTP para buscar dados sobre cada rede. Caso encontre problemas, o sistema exibe mensagens de erro.

## Configuração e Instalação

1. **Pré-requisitos**:
   - Flutter SDK instalado ([Instruções de instalação](https://flutter.dev/docs/get-started/install)).
   - Servidor JSON para simular o backend. O arquivo `db.json` deve ser configurado corretamente e localizado em `backend/` na raiz do projeto.

2. **Passos de Instalação**:
   - Clone o repositório do projeto:
     ```bash
     git clone <URL-do-repositório>
     ```
   - Navegue até a pasta do projeto:
     ```bash
     cd data_defender
     ```
   - Instale as dependências do Flutter:
     ```bash
     flutter pub get
     ```
   - Inicie o servidor JSON:
     ```bash
     json-server --watch backend/db.json --port 3000
     ```

3. **Configuração do Backend**:
   - Certifique-se de que o `db.json` contém dados de rede, como dispositivos e suas atividades.

4. **Execução do Projeto**:
   - Inicie o aplicativo em seu ambiente de desenvolvimento (ex.: navegador, emulador Android/iOS):
     ```bash
     flutter run
     ```

## Estrutura do JSON no Backend
O `db.json` deve conter uma lista de redes e dispositivos, estruturada conforme o exemplo:

```json
{
  "networks": [
    {
      "id": "0",
      "devices": [
        {
          "device": "Laptop",
          "ip": "192.168.0.5",
          "dataTransferred": 200,
          "connections": ["8.8.8.8"],
          "connectionTime": "02:15",
          "secureConnection": true,
          "packetsSent": 300,
          "packetsReceived": 350
        }
      ]
    }
  ]
}
