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
  int _currentIndex = 0;
  List _listPages = List();

  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(StatelessPage(
          child: Center(
        child: Icon(
          Icons.cake,
          size: 120.0,
          color: Colors.amber,
        ),
      )))
      ..add(StatelessPage(
          child: Center(
              child: Icon(
        Icons.sentiment_satisfied,
        size: 120.0,
        color: Colors.green,
      ))))
      ..add(StatelessPage(
          child: Center(
              child: Icon(Icons.access_alarm,
                  size: 120.0, color: Colors.orange))));
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //cureent active index
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            title: Text('_Birthday'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            title: Text('Gratitude'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text('Birthday'),
          )
        ],
        onTap: (int selectedIndex) => _changePage(selectedIndex),
      ),
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
        flexibleSpace: SafeArea(
            child: Icon(Icons.photo_camera, size: 75.0, color: Colors.white70)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
    );
  }
}
