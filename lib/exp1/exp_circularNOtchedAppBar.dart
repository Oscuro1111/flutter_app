import 'package:flutter/material.dart';

//Example of creting bootm navigation bar
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class StatelessPage extends StatelessWidget {
  const StatelessPage({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.access_alarm),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(Icons.bookmark_border),
                color: Colors.white,
                onPressed: () {}),
            IconButton(
              icon: Icon(Icons.flight),
              color: Colors.white,
              onPressed: () {},
            ),
            Divider()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
