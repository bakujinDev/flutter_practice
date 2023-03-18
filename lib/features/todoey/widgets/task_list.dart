import 'package:flutter/material.dart';
import 'package:flutter_practice/features/todoey/models/task.dart';
import 'package:flutter_practice/features/todoey/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: tasks[index].isDone,
          taskTitle: tasks[index].name,
          toggleCheckBoxState: () {
            tasks[index].toggleDone();
            setState(() {});
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
