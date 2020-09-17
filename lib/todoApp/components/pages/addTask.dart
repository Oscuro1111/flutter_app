import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddTask extends StatefulWidget {
  AddTask(
      {@required this.validaor, @required this.addTask, @required this.moveTo});

  void Function(String, int, DateTime) addTask;
  void Function(int) moveTo;
  final GlobalKey<FormFieldState> key1 = GlobalKey<FormFieldState>();
  String Function(String) validaor;
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _scrollController = ScrollController();
  int _radioGroupValue = -1;
  DateTime dueTime;
  String task;
  void _onSelect(int index) {
    setState(() {
      _radioGroupValue = index;
    });
  }

  void _submit() {
    if (widget.key1.currentState.validate() == false) {
      _scrollController.animateTo(1.0,
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      widget.addTask(widget.key1.currentState.value.toString(),
          _radioGroupValue > 0 ? _radioGroupValue : 2, dueTime);
      widget.moveTo(1);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Card(
              elevation: 8.0,
              child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(color: Colors.purple.shade400),
                  child: ListTile(
                    leading: Icon(
                      Icons.alarm_add,
                      size: 25.0,
                      color: Colors.greenAccent,
                    ),
                    title: Text(
                      'Add Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  ))),
          Divider(),
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              key: widget.key1,
              validator: widget.validaor,
              decoration: InputDecoration(
                  labelText: 'Input Task',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
          ),
          Column(
            children: <Widget>[
              Text('Low Priority'),
              Radio(
                  value: 1, groupValue: _radioGroupValue, onChanged: _onSelect),
              Text('Medium Priority'),
              Radio(
                  value: 2, groupValue: _radioGroupValue, onChanged: _onSelect),
              Text('High Priority'),
              Radio(
                  value: 3, groupValue: _radioGroupValue, onChanged: _onSelect)
            ],
          ),
          Text(
            'Pick Due date',
            style: Theme.of(context).textTheme.headline4,
          ),
          CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2020, 1, 1, 1), //Range
              lastDate: DateTime(2025, 1, 1, 1),
              onDateChanged: (DateTime date) {
                DateTime today = DateTime.now();
                int def = date.day - today.day;

                if (def < 0) {}
                setState(() {
                  dueTime = date;
                });
              }),
          Container(
              child: FloatingActionButton.extended(
                  icon: Icon(Icons.done),
                  label: Text(
                    'Add',
                    style: TextStyle(color: Colors.purple),
                  ),
                  onPressed: () {
                    _submit();
                  })),
        ],
      ),
    );
  }
}
