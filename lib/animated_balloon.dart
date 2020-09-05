import 'package:flutter/material.dart';

class AnimatedBallonWidget extends StatefulWidget {
  @override
  _AnimatedBallonWidgetState createState() => _AnimatedBallonWidgetState();
}

class _AnimatedBallonWidgetState extends State<AnimatedBallonWidget>
    with TickerProviderStateMixin {
  AnimationController _controllerFloatUp;
  AnimationController _controllerGrowSize;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();

    _controllerFloatUp =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    _controllerGrowSize =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _ballonHeight = MediaQuery.of(context).size.width / 2;
    double _ballonWidth = MediaQuery.of(context).size.height / 3;

    double _balloonBottomLocation =
        MediaQuery.of(context).size.height - _ballonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controllerFloatUp, curve: Curves.fastOutSlowIn));
    _animationGrowSize = Tween(begin: 50.0, end: _ballonWidth).animate(
        CurvedAnimation(
            parent: _controllerGrowSize, curve: Curves.elasticInOut));

    _controllerFloatUp.forward();
    _controllerGrowSize.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
          }
        },
        child: Image.asset(
          'assets/imgs/ballon.jpg',
          height: _ballonHeight,
          width: _ballonWidth,
        ),
      ),
    );
  }
}
