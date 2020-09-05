import 'package:flutter/material.dart';
import './crossFade.dart';
import './animate_opacity.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _height = 100.0;
  double _width = 100.0;

  _increaseWidth() {
    setState(() {
      _width = _width >= 320.0 ? 100.0 : _width += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.pause),
              Icon(Icons.stop),
              Icon(Icons.access_time)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          //wider label+icon
          onPressed: () {},
          icon: Icon(Icons.play_arrow),
          label: Text('Play'),
        ),
        appBar: AppBar(
          title: Text('Home'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
          flexibleSpace: SafeArea(
              child:
                  Icon(Icons.photo_camera, size: 75.0, color: Colors.white70)),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOutExpo,
                          color: Colors.amber,
                          height: _height, //Container dimmentions
                          width: _width,
                          child: FlatButton(
                            child: Text('Tab to \nGrow Width\n$_width'),
                            onPressed: () {
                              _increaseWidth();
                            },
                          ),
                        ),
                        Divider(),
                        AnimatedCrossFadeWidget(),
                        Divider(),
                        AnimatedOpacityWidget()
                      ],
                    )))));
  }
}
