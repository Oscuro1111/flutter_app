import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';

WSNotifications sockets = WSNotifications();

const SERVER_ADDRESS = 'ws://localhost:34263/svc/websockets';

class WSNotifications {
  static final WSNotifications _sockets = new WSNotifications._internel();

//now we have to create and return instance of object and "-this- cannot be used"
  factory WSNotifications() {
    return _sockets;
  }

  WSNotifications._internel(); //named constructor create new

  IOWebSocketChannel _channel;

  bool _isOn;

  ObserverList<Function> _listeners = new ObserverList<Function>();

  void initCommunication() async {
    reset();
    try {
      _channel = new IOWebSocketChannel.connect(SERVER_ADDRESS);

      _channel.stream.listen(_onReceptionofMessgageFromServer);
    } catch (e) {
      ///Generel error handling
    }
  }

  reset() {
    if (_channel != null) {
      if (_channel.sink != null) {
        _channel.sink.close();
        _isOn = false;
      }
    }
  }

  send(String message) {
    if (_channel != null) {
      if (_channel.sink != null && _isOn) {
        _channel.sink.add(message);
      }
    }
  }

  addListener(Function callback) {
    _listeners.remove(callback);
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
