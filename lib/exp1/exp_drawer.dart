import 'package:flutter/material.dart';

//Example of TabBar implementaion with tabView
//There is no goal.

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Page extends StatelessWidget {
  const Page({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}

const List<Widget> listPages = [
  Page(
      child: Center(
    child: Icon(Icons.cake, size: 120.0, color: Colors.orange),
  )),
  Page(
    child: Center(
        child: Icon(Icons.sentiment_satisfied,
            size: 120.0, color: Colors.lightGreen)),
  ),
  Page(
    child: Center(
      child: Icon(Icons.access_alarm, size: 120.0, color: Colors.purple),
    ),
  )
];

class MenuListTile extends StatefulWidget {
  @override
  _MenuListTileState createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthday'),
          onTap: () {
            //Navigator.pop(context); //close opened drawer
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => listPages[0]));
          },
        ),
        ListTile(
            leading: Icon(Icons.sentiment_satisfied),
            title: Text('Gratitude'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => listPages[1]));
            }),
        ListTile(
          leading: Icon(Icons.alarm),
          title: Text('Reminder'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => listPages[2]));
          },
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.face,
              size: 48.0,
              color: Colors.green,
            ),
            accountName: Text('Oscuro Smith'),
            accountEmail: Text('oscurosmith@outlook.com'),
            otherAccountsPictures: [
              Icon(
                Icons.bookmark_border,
                color: Colors.green,
              )
            ],
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/imgs/ballon.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.blueAccent),
          ),
          MenuListTile(),
        ],
      ),
    );
  }
}

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.face,
              size: 128.0,
              color: Colors.white54,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          MenuListTile() //lists
        ],
      ),
    );
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Birthday')),
        drawer: LeftDrawer(),
        endDrawer: RightDrawer(),
        body: Container());
  }
}
