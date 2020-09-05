import 'package:flutter/material.dart';

class BtnBar extends StatelessWidget {
  const BtnBar();
  @override
  Widget build(BuildContext contex) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.airport_shuttle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.brush),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class ContainerWithBoxDecoration extends StatelessWidget {
  const ContainerWithBoxDecoration();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.lightGreen.shade500]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Center(
            child: RichText(
                text: TextSpan(
                    text: 'Flutter World',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.deepPurpleAccent,
                        decorationStyle: TextDecorationStyle.dotted,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal),
                    children: <TextSpan>[
                  TextSpan(text: ' for '),
                  TextSpan(
                      text: 'Mobile',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold))
                ])),
          ),
        ),
      ],
    );
  }
}

class TodoMenuItem {
  const TodoMenuItem({this.title, this.icon});
  final String title;
  final Icon icon;
}

//Create a list of menu items for popupmenu
List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Fast Food', icon: Icon(Icons.fastfood)),
  TodoMenuItem(title: 'Remind Me', icon: Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
  TodoMenuItem(title: 'Music', icon: Icon(Icons.audiotrack)),
];

class PopupMenuBottomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PopupMenuBottomWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
          icon: Icon(Icons.view_list),
          onSelected: ((valueSelected) {
            print('valueSelected:$valueSelected');
          }),
          itemBuilder: (BuildContext context) {
            //start building items for list to show.
            return foodMenuList.map((TodoMenuItem item) {
              return PopupMenuItem<TodoMenuItem>(
                  value: item,
                  textStyle: TextStyle(color: Colors.blueGrey),
                  child: Row(
                    children: <Widget>[
                      Icon(item.icon.icon),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Text(item.title),
                    ],
                  ));
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.0);
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
          bottom: PopupMenuBottomWidget(),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('Column and Row Nesting 1'),
                  Divider(),
                  Text('Column and Row Nesting 2'),
                  Divider(),
                  Text('Column and Row Nesting 3'),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, //put space equally between children
                    children: <Widget>[
                      Text('Row Nesting 1'),
                      Text('Row Nesting 2'),
                      Text('Row Nesting 3')
                    ],
                  ),
                  FlatButton(
                      onPressed: () {}, child: Text('Flag')), //default left
                  FlatButton(
                    onPressed: () {},
                    child: Icon(Icons.flag),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    splashColor: Colors
                        .blueAccent, //-left to right highlight color move filles
                    // highlightColor: Colors.deepOrange,//
                  ),
                  //default-Left button
                  RaisedButton(
                      onPressed: () {},
                      child: Icon(Icons.save),
                      color: Colors.lightGreen),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          color: Colors.green,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.flight),
                            iconSize: 42.0,
                            color: Colors.white,
                            tooltip: 'Flight',
                          ))
                    ],
                  ),
                  BtnBar(),
                  Image.asset('assets/imgs/img1.jpg')
                ],
              ),
            ),
          ),
        ));
  }
}
