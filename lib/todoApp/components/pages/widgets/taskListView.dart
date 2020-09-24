import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../mainState.dart';

double Function(double, double) percentage =
    (double wid, double percent) => (percent / 100) * wid;

Widget priorityMeter(int priority, String child, BuildContext context) {
  Color color;

  double width = MediaQuery.of(context).size.width;

  double boxWidth;

  switch (priority) {
    case 1:
      color = Colors.amber;
      boxWidth = width - percentage(width, 70);
      break;
    case 2:
      color = Colors.blue;
      boxWidth = width - percentage(width, 50);
      break;
    case 3:
      color = Colors.red;
      boxWidth = width - percentage(width, 10);
      break;
    default:
      color = Colors.black;
  }

  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    AnimatedContainer(
        padding: EdgeInsets.all(8.0),
        height: percentage(MediaQuery.of(context).size.height, 10),
        width: boxWidth,
        color: color,
        child: Text(
          child,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.center,
        curve: Curves.bounceInOut,
        duration: Duration(seconds: 1))
  ]);
}

Text text2(String text) => Text(
      text,
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: Colors.white),
    );

// ignore: non_constant_identifier_names
Widget header_comp(String text, BuildContext context) {
  Widget textW = text2(text);

  double width = MediaQuery.of(context).size.width;

  double widthPadding = width - percentage(width, 70); //30%

  return Card(
    elevation: 8.0,
    child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Padding(
            padding: EdgeInsets.fromLTRB(widthPadding, 5, widthPadding, 5),
            child: textW)),
  );
}

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
    DateTime taskDate = task.dueDate == null ? DateTime.now() : task.dueDate;

    return Scaffold(
      appBar: AppBar(title: Text('Task')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            header_comp(task.task, context),
            Divider(),
            Text('Priority',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            Divider(),
            priorityMeter(task.priority, priority[task.priority], context),
            Divider(),
            Text('Due date:-${taskDate.day}/${taskDate.month}/${taskDate.year}',
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
