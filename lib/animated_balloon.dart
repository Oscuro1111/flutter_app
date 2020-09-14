import 'package:flutter/material.dart';

class AnimatedBallonWidget extends StatefulWidget {
  @override
  _AnimatedBallonWidgetState createState() => _AnimatedBallonWidgetState();
}

class _AnimatedBallonWidgetState extends State<AnimatedBallonWidget>
    with TickerProviderStateMixin {
  //implement callback which  registerd on windpws.onFrameChange make Animation controller genreate value on each frame.
  AnimationController _controllerFloatUp;
  AnimationController _controllerGrowSize;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;
  Animation<double> _moveright;

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

    //tween mapper
    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controllerFloatUp,
            curve: Interval(0.0, 0.500, curve: Curves.easeInOut)));

    _moveright = Tween<double>(begin: 0.0, end: 50.0).animate(CurvedAnimation(
      parent: _controllerFloatUp,
      curve: Interval(
        0.500,
        1.0,
      ),
    ));

    _animationGrowSize = Tween(begin: 50.0, end: _ballonWidth).animate(
        //Tween is a stateless object which only map values of animation controller 0.0 to 1.0 to begin end range in duration given by controller

        /*
          What Tween is doing?
          animation produless values per frame
          let x frames persecond genrated =x/1 seconds;
          x=animation values will be genrated per second(linerly in between 0.0. to 1.0)

          total number of values genration in t seconds   =t*x
          set Inputes= inputValues[i...nth]
          Tween(begin,end)-mapping

          Genreal case :
          let some i belongd to Inputes 

           function(i) = slope*i
           function(i) = slope*i*correction_factor          
          function(i)=begin
          .
          .
          .
          function(nth)=end

      */
        CurvedAnimation(
            parent:
                _controllerGrowSize, //controller maintain the duartion at which animation run.
            curve: Curves
                .elasticInOut)); //define at what rate animation is going to change fun(input)=slope*input

    return AnimatedBuilder(
      //Animation builder subscribed to this animation object and listen for each value change and run build
      animation: _animationFloatUp, //motion range or duration main duartion
      builder: (context, child) {
        //builder calle every time when animation changes inject between widgets and a part of render tree listen for animation value  change.
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp
                .value, //_animationFloatUp.value, //last position
            left: _moveright.value,
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
