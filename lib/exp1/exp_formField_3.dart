import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class ImageAndIconWidget extends StatelessWidget {
  const ImageAndIconWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image(
          image: AssetImage('assets/imgs/img1.jpg'),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        )
      ],
    );
  }
}

class BoxDecorationWidget extends StatelessWidget {
  const BoxDecorationWidget();

  @override
  Widget build(BuildContext contex) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0))
            ]),
      ),
    );
  }
}

class InputDecorationWidget extends StatelessWidget {
  const InputDecorationWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
              labelText: "Notes" //kind a placeholder,
              ,
              labelStyle: TextStyle(color: Colors.purple),
              //border: OutlineInputBorder(),
              border: UnderlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  //initial border look
                  borderSide: BorderSide(color: Colors.purple))),
        ),
        Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Enter your notes.',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
        )
      ],
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
                        const ImageAndIconWidget(),
                        const BoxDecorationWidget(),
                        const InputDecorationWidget()
                      ],
                    )))));
  }
}
