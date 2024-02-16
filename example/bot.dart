import '../lib/src/lux.dart';

void main() async {
  final client = Client();

  client.on(Events.Ready, (ClientUser user) {
    print('Bot is ready!');
  });

  await client.login("token");
}