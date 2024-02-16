import 'Client.dart';

class ClientUser {
  Client _client;
  Map<String, dynamic> _userData;

  ClientUser(Client client, Map data) {
    _client = client;
    _userData = data;
  }

  String getId() {
    return _userData['id'];
  }

  String getName() {
    return _userData['name'];
  }
}