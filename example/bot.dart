import '../lib/src/lux.dart';

void main() async {
  final client = Client();

  client.on(Events.ready, (ClientUser user) {
    String name = user.getName();
    print(name + ' is ready!');
  });

  await client.login("token");
}