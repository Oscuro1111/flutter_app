import 'package:web_socket_channel/io.dart';

void main() async {
  IOWebSocketChannel channel =
      new IOWebSocketChannel.connect('ws://127.0.0.1:5000');
}
