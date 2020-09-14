import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  Gratitude({Key key, @required this.radioGroupValue});
  final int radioGroupValue;

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = List();
  String _selectedGratitude;
  int _radioGroupValue;

  void _radioOnChange(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (int index) => _radioOnChange(index),
              ),
              Text('Family'),
              Radio(
                  value: 1,
                  groupValue: _radioGroupValue,
                  onChanged: (int index) => _radioOnChange(index)),
              Text('Friends'),
              Radio(
                  value: 2,
                  groupValue: _radioGroupValue,
                  onChanged: (int index) => _radioOnChange(index)),
              Text('Coffee'),
            ],
          ),
        ),
      ),
    );
  }
}
