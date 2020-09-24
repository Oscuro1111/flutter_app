import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac'),
      ),
      body: SafeArea(
        child: Container(child: Text('Tick-Tac')),
      ),
    );
  }
}
