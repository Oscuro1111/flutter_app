import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Order {
  String item;
  int quantity;
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  Order _order = Order();

  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : null;
  }

  String _validateItemCount(String value) {
    int _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);

    return _valueAsInteger == 0 ? 'At least one item required' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState.validate()) {
      _formStateKey.currentState.save();
      print('Order Item:${_order.item}');
      print('Order Qunatity:${_order.quantity}');
    }
  }

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
                        Form(
                            key: _formStateKey,
                            autovalidate: true,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Espresso',
                                        labelText: 'item'),
                                    validator: (value) =>
                                        _validateItemRequired(value),
                                    onSaved: (value) => _order.item = value,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        //hintText like a placeholder
                                        hintText: '3',
                                        labelText: 'Quantity'),
                                    validator: (value) =>
                                        _validateItemCount(value),
                                    onSaved: (value) =>
                                        _order.quantity = int.tryParse(value),
                                  ),
                                  Divider(
                                    height: 32.0,
                                  ),
                                  RaisedButton(
                                      child: Text('save'),
                                      color: Colors.lightGreen,
                                      onPressed: () => _submitOrder())
                                ],
                              ),
                            ))
                      ],
                    )))));
  }
}
