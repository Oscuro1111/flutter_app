import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class OreintationWidgetLayout extends StatelessWidget {
  const OreintationWidgetLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            height: 100.0,
            width: 100,
            child: Text('Portrait'),
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.lightGreen,
            height: 100.0,
            width: 200.0,
            child: Text('Landscape'),
          );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.school,
                size: 48.0,
              )
            ],
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Icon(
              Icons.school,
              size: 48.0,
            ),
            Icon(Icons.brush, size: 48.0)
          ]);
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 3.0, //width:height  =width/height = 1/2*height
      children: List.generate(
          8,
          (int index) => Text(
                'Grid $index',
                textAlign: TextAlign.center,
              )),
    );
  }
}

class _HomeState extends State<Home> {
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
                      children: <Widget>[
                        const OrientationLayoutWidget(),
                        Divider(),
                        const OreintationWidgetLayout(),
                        Divider(),
                        const GridViewWidget()
                        //GridViewWidget extends StatelessWidget{}
                      ],
                    )))));
  }
}
