import 'dart:math';

import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  _FancyButtonState();
  Color _getColors() {
    print('color');
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
  }

  // Color color; no iunused err message inside it
  @override
  Widget build(BuildContext context) {
    print('Rendered...');
    return Container(
      child: RaisedButton(
        color: _getColors(),
        child: widget.child,
        onPressed: widget.onPressed, //widget is a configration
      ),
    );
  }
}

final _random = new Random();
int next(int min, int max) => min + _random.nextInt(max - min);

var colors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.amber,
  Colors.lightBlue
];

var _buttonColors = <_FancyButtonState, Color>{};
