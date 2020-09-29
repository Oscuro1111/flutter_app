
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
          child: GridView.extent(
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3/3,
            maxCrossAxisExtent: 330.0,
            scrollDirection: Axis.vertical,//flipping the whole grid view
            padding: EdgeInsets.all(8.0),
            children: List.generate(100, (index) => _buildBody()),
          ),
        ));
  }
}
