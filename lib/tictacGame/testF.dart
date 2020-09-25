import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Ws {
  static final Ws _socket = new Ws._internal();

  IOWebSocketChannel _channel;

  factory Ws() {
    return _socket;
  }

  void init() {
    _channel = IOWebSocketChannel.connect('ws://appserver0.herokuapp.com');

    _channel.stream.listen(_onRecieveData);
  }

  ObserverList<Function> _listener = ObserverList<Function>();

  void addListner(Function callback) {
    _listener.add(callback);
  }

  void removeListener(Function callback) {
    _listener.remove(callback);
  }

  void _onRecieveData(message) {
    print("Data recieved");
    Map data = json.decode(message);

    _listener.map((callback) => callback(data['action']));
  }

  Ws._internal();
}

class PageS extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<PageS> {
  String data;

  Ws socket;
  @override
  void initState() {
    super.initState();

    socket = Ws();
    socket.addListner(onData);
  }

  @override
  void dispose() {
    super.dispose();

    socket.removeListener(onData);
  }

  void onData(String dt) {
    setState(() {
      data = dt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Application'),
        ),
        body: SafeArea(
          child: Container(
            child: Text((data != null ? data : "hello")),
          ),
        ));
  }
}
