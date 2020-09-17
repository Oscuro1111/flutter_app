import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../mainState.dart';

class Description extends StatelessWidget {
  Description({@required this.task});
  final Task task;

  final List<String> priority = [
    null,
    'Low priority',
    'Medium priority',
    'High priority'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              task.task,
              style: Theme.of(context).textTheme.headline2,
            ),
            Divider(),
            Text('Priority',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            Divider(),
            Text(
              '${priority[task.priority]}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(),
            Text(
                'Due date:-${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}',
                style: Theme.of(context).textTheme.headline4)
          ],
        ),
      ),
    );
  }
}

class TaskView extends StatelessWidget {
  TaskView({@required this.taskData, @required this.pos, @required this.del});

  final Function(int) del;
  final Task taskData;
  final pos;
  final List<String> priority = [
    null,
    'Low priority',
    'Medium priority',
    'High priority'
  ];

  final colors = [Colors.black, Colors.green, Colors.amber, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        child: ListTile(
          leading: Icon(
            Icons.work,
            size: 30.0,
            color: Colors.green,
          ),
          title: Text(taskData.task),
          subtitle: Text(
            priority[taskData.priority],
            style: TextStyle(color: colors[taskData.priority]),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              del(pos);
              //print('Done task ${taskData.task}.');
            },
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => Description(task: taskData)));
          },
        ));
  }
}

class TaskListView extends StatelessWidget {
  const TaskListView({@required this.list, @required this.delTask});
  final List<Task> list;
  final Function(int) delTask;

  @override
  Widget build(BuildContext context) {
    print(list);
    return Container(
        padding: EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, int index) => TaskView(
                  taskData: list[index],
                  pos: index,
                  del: delTask,
                )));
  }
}
