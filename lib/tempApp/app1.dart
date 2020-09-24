import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: SafeArea(
          //provide unbound height
          child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[Text('Hello App')],
          )
        ],
      )),
    );
  }
}
