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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController; //coordinate between tabBar and TabBarView

  @override
  void initState() {
    super.initState();

    //Going to subscribed to two TabBar and TabBarView
    _tabController =
        TabController(length: 3, vsync: this); //length 3//tabBars used 3

    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _tabChanged() {
    if (_tabController.indexIsChanging) {
      print('tabChanged:${_tabController.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab bar')),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.amber, //sected label color
          unselectedLabelColor: Colors.green,
          tabs: [
            Tab(icon: Icon(Icons.cake), text: 'Birthday'),
            Tab(
              icon: Icon(Icons.sentiment_satisfied),
              text: 'Gratitude',
            ),
            Tab(icon: Icon(Icons.access_alarm), text: 'Reminder')
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
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
                child:
                    Icon(Icons.access_alarm, size: 120.0, color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
