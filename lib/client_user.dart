import 'client.dart';

class ClientUser {
  final Client client;
  final Map<String, dynamic> _userData;

  ClientUser(this.client, Map<String, dynamic> data) : _userData = data;

  String getId() {
    return _userData['id'];
  }

  String getName() {
    return _userData['name'];
  }
}