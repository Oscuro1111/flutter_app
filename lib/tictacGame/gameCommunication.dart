import 'dart:convert';

// ignore: unused_import
import 'package:flutter/foundation.dart';

import './websocketsHelper.dart';

GameCommunication game = new GameCommunication();

class GameCommunication {
  static final GameCommunication _game = new GameCommunication._internal();

  ObserverList<Function> _listener = new ObserverList<Function>();
  //named empty constructor
  GameCommunication._internal() {
    sockets.initCommunication();
    sockets.addListener(_onMessageRecieved);
  }

  String _playerName = "";

  String _playerID = "";

  String get playerID => _playerID;
  String get playerName => _playerName;

  factory GameCommunication() {
    return _game;
  }

  _onMessageRecieved(serverMessage) {
    ///
    /// As messages are sent as a String
    /// let's deserialize it to get the corresponding
    /// JSON object

    Map message = json.decode(serverMessage);

    switch (message['action']) {
      case 'connect':
        _playerID = message['data'];
        break;

      ///
      /// For any other incoming message, we need to
      /// dispatch it to all the listeners

      default:
        _listener.forEach((Function callback) {
          callback(message);
        });
    }
  }

  send(String action, String data) {
    if (action == 'join') {
      _playerName = data;
    }
    sockets.send(json.encode({"action": action, "data": data}));
  }

  addListener(Function callback) {
    _listener.add(callback);
  }

  removeListener(Function callback) {
    _listener.remove(callback);
  }
}
