import 'package:flutter/material.dart';
import 'package:flutter_practice/features/todoey/models/task.dart';
import 'package:flutter_practice/features/todoey/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          toggleCheckBoxState: () {
            widget.tasks[index].toggleDone();
            setState(() {});
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
