import 'dart:convert';
import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'client_user.dart';
import 'message.dart';
import 'events.dart';

class Client {
  final String _websocketUrl = 'wss://guilded.gg/websocket/v1';
  final Map<Events, Function> _e = <Events, Function>{};


  Future<void> login(String botToken) async {
    WebSocketChannel.connect(_websocketUrl), headers: {
      'Authorization': 'Bearer $botToken',
      ''
    };

    _webSocketChannel.stream.listen((data) {
      print('WebSocket data: $data');
    });

    _e.forEach((key, value) {
      if (key == Events.Ready) {
        value.call(ClientUser(this, null));
      }
    });
  }

  void on(Events event, Function f) {
    _e[event] = f;
    switch (event) {
      case Events.Message:
        {
          f(Message());
          break;
        }

      default:
        {
          break;
        }
    }
  }

  ClientUser getUser() {
    return ClientUser(this, null);
  }
}