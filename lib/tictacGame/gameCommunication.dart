import 'dart:convert';

// ignore: unused_import
import 'package:flutter/foundation.dart';

import './websocketsHelper.dart';

GameCommunication game = new GameCommunication();

class GameCommunication {
  ///------------------------------------------------------------
  factory GameCommunication() {
    return _game;
  }
  //named empty constructor
  GameCommunication._internal() {
    sockets.initCommunication();
    sockets.addListener(_onMessageRecieved);
  }

  ///------------------------------------------------------------///

  static final GameCommunication _game = new GameCommunication._internal();

  ObserverList<Function> _listener = new ObserverList<Function>();

  String playerName = "";

  String playerID = "";

  _onMessageRecieved(serverMessage) {
    ///
    /// As messages are sent as a String
    /// let's deserialize it to get the corresponding
    /// JSON object

    Map message = json.decode(serverMessage) as Map;

    switch (message['action']) {
      case "connect":
        playerID = message['data'];
        break;

      /// For any other incoming message, we need to
      /// dispatch it to all the listeners

      default:
        _listener.forEach((Function callback) {
          callback(message);
        });
        break;
    }
  }

  send(String action, String data) {
    if (action == 'join') {
      playerName = data;
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
