import 'package:flutter/material.dart';
import './pages/addTask.dart';
import './pages/activeTask.dart';

/*
   Navigation bar-|-active -Active task 
                  |-Dued   -passed due date
                  |-Add    -add new task   
Add-InputBox -Write task
   -priorty
   -due date

Genreal feature -checked
                -remove
*/

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

class Task {
  const Task(
      {@required this.task, @required this.priority, @required this.dueDate});
  final String task;
  final int priority;
  final DateTime dueDate;
}

class MainState extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainState> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Task> taskList = [];

  void addTask(String task, int priority, DateTime dueDate) {
    taskList.add(Task(task: task, priority: priority, dueDate: dueDate));
  }

  String validator(String value) {
    return value.length != 0 ? null : 'cannot be empty';
  }

  void movePage(int index) {
    _tabController.animateTo(index);
  }

  void _del(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do'),
        ),
        bottomNavigationBar: SafeArea(
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black38,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.add_alarm), text: 'Add Task'),
              Tab(icon: Icon(Icons.access_alarm), text: 'Active Task'),
              //  Tab(icon: Icon(Icons.assignment_late), text: 'Dued Task'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              AddTask(
                validaor: validator,
                addTask: addTask,
                moveTo: movePage,
              ),
              ActiveTaskList(
                activeTaskList: taskList,
                delTask: _del,
              ),
            ],
          ),
        ));
  }
}
