
import 'package:flutter/material.dart';

class GridViewLayoutM extends StatefulWidget {
  @override
  _GridViewLayoutState createState() => _GridViewLayoutState();
}

class _GridViewLayoutState extends State<GridViewLayoutM> {

  Widget _buildBody(){

    return Container(
        color: Colors.green,
        padding: EdgeInsets.all(8.0),
        child: Card(
          color: Colors.amber,
          child: InkWell(
            child: Padding(padding: EdgeInsets.all(50.0), child: Text("Hello")),
            onTap: () {},
            borderRadius: BorderRadius.circular(16.0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GridView Oscuro"),
        ),
        body: SafeArea(
          child: Text("GridView.builder"),
          ),
        );
  }
}
