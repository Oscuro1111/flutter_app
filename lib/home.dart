import 'package:flutter/material.dart';

//Example of TabBar implementaion with tabView
//There is no goal.

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget item2 = InkWell(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        Icons.alarm,
        size: 40.0,
        color: Colors.blue,
      ),
      Divider(),
      Text(
        'subtitle',
        style: TextStyle(fontSize: 16.0),
      ),
    ],
  ),
);
Widget item = Card(
    //shape: StadiumBorder(),
    elevation: 8.0, //default value is 1.0 if null
    color: Colors.white,
    margin: EdgeInsets.all(16.0),
    child: ListTile(
      leading: Icon(
        Icons.flight,
        size: 40.0,
        color: Colors.blue,
      ),
      subtitle: Text(
        'flight paid',
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      title: Text('Airoplane'),
      trailing: Text('20%'),
      onTap: () {},
    ));

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            item2,
            item,
          ],
        ));
  }
}
