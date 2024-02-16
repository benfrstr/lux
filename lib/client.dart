import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'client_user.dart';
import 'message.dart';
import 'events.dart';

class Client {
  final String websocketUrl = 'wss://guilded.gg/websocket/v1';
  final Map<Events, Function> _e = <Events, Function>{};
  final Map<String, dynamic> user = {};
  String botToken = '';

  String getToken() {
    return botToken;
  }

  Future<void> login(String token) async {
    botToken = token;

    final webSocketChannel = WebSocketChannel.connect(
      Uri.parse('$websocketUrl?token=$token'),
    );

    webSocketChannel.stream.listen((data) {
      print('WebSocket data: $data');
    });

    _e.forEach((key, value) {
      if (key == Events.ready) {
        value.call(ClientUser(this, user));
      }
    });
  }

  void on(Events event, Function f) {
    _e[event] = f;
    switch (event) {
      case Events.message:
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
    if (botToken == '') {
      throw 'ClientError: "No bot token was given"';
    }
    return ClientUser(this, user);
  }
}