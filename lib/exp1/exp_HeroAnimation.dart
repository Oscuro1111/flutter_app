import 'package:flutter/material.dart';
import '../gratitude.dart';
import '../fly.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('About Page.'),
        ),
      ),
    );
  }
}

class _HomeState extends State<Home> {
  String _howAreYou = "...";

  void _openPageAbout({BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: fullscreenDialog,
          builder: (context) => About(),
        ));
  }

  void _openPageGratitude(
      {BuildContext context, bool fullscreenDialog = false}) async {
    final String _gartitudeResponse = await Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: fullscreenDialog,
            builder: (context) => Gratitude(radioGroupValue: -1)));

    setState(() {
      _howAreYou = _gartitudeResponse ?? '';
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
          onPressed: () => _openPageGratitude(context: context),
          tooltip: 'About',
          icon: Icon(Icons.sentiment_satisfied),
          label: Text('Play'),
        ),
        appBar: AppBar(
          title: Text('Home'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () => _openPageAbout(
                      context: context,
                      fullscreenDialog: true,
                    )),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
          flexibleSpace: SafeArea(
              child:
                  Icon(Icons.photo_camera, size: 75.0, color: Colors.white70)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GestureDetector(
                child: Hero(
                  tag: 'format_paint',
                  child: Icon(
                    Icons.format_paint,
                    color: Colors.lightGreen,
                    size: 120.0, //px,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (contex) => Fly()),
                  );
                }),
          ),
        ));
  }
}
