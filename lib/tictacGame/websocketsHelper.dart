import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

WSNotifications sockets = WSNotifications();

const SERVER_ADDRESS = 'wss://appserver0.herokuapp.com';

class WSNotifications {
  static final WSNotifications _sockets = new WSNotifications._internel();

//now we have to create and return instance of object and "-this- cannot be used"
  factory WSNotifications() {
    return _sockets;
  }

  WSNotifications._internel(); //named constructor create new
  WebSocketChannel _channel;

  bool _isOn = false;

  ObserverList<Function> _listeners = new ObserverList<Function>();

  void initCommunication() async {
    reset();

    _channel = new WebSocketChannel.connect(Uri.parse(SERVER_ADDRESS));
    _channel.stream.listen(_onReceptionofMessgageFromServer);
  }

  void reset() {
    if (_channel != null) {
      if (_channel.sink != null) {
        _channel.sink.close();
        _isOn = false;
      }
    }
  }

  void send(String message) {
    if (_channel != null) {
      if (_channel.sink != null && _isOn) {
        _channel.sink.add(message);
      }
    }
  }

  addListener(Function callback) {
    _listeners.add(callback);
  }

  removeListener(Function callback) {
    _listeners.remove(callback);
  }

  _onReceptionofMessgageFromServer(message) {
    _isOn = true;
    _listeners.forEach((Function callback) {
      callback(message);
    });
  }
}
