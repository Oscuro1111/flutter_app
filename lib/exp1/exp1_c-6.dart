import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Icon(Icons.photo_camera, size: 75.0, color: Colors.white70)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    buildRow(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              color: Colors.yellow,
                              height: 40.0,
                              width: 40.0,
                            ),
                            Padding(padding: EdgeInsets.all(16.0)),
                            Container(
                              color: Colors.brown,
                              height: 20.0,
                              width: 20.0,
                            ),
                            Divider(),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                    backgroundColor: Colors.lightGreen,
                                    radius: 100.0,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            height: 100.0,
                                            width: 100.0,
                                            color: Colors.yellow),
                                        Container(
                                            height: 60.0,
                                            width: 60.0,
                                            color: Colors.amber),
                                        Container(
                                            height: 40.0,
                                            width: 40.0,
                                            color: Colors.brown)
                                      ],
                                    )),
                                Divider(),
                                Text("End of the line.")
                              ],
                            ),
                            Divider(),
                            Text("End of the line."),
                          ],
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 40.0,
          width: 40.0,
        ),
        Padding(padding: EdgeInsets.all(16.0)),
        Expanded(
            //flex-grow
            child: Container(
          color: Colors.amber,
          height: 40.0,
          width: 40.0,
        )),
        Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Container(color: Colors.brown, height: 40.0, width: 40.0)
      ],
    );
  }
}
