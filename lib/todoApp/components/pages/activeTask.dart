import 'package:flutter/material.dart';
import 'package:flutter_app/todoApp/components/mainState.dart';
import './widgets/taskListView.dart';

class ActiveTaskList extends StatefulWidget {
  ActiveTaskList({@required this.activeTaskList, @required this.delTask});
  final Function(int) delTask;
  final List<Task> activeTaskList;
  @override
  _ActiveTaskListState createState() => _ActiveTaskListState();
}

class _ActiveTaskListState extends State<ActiveTaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Card(
          elevation: 6.0,
          child: Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(color: Colors.purple.shade400),
              child: ListTile(
                leading: Icon(
                  Icons.access_alarm,
                  size: 25.0,
                  color: Colors.greenAccent,
                ),
                title: Text(
                  'Active Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ))),
      Expanded(
          child: TaskListView(
        list: widget.activeTaskList,
        delTask: widget.delTask,
      ))
    ]);
  }
}
