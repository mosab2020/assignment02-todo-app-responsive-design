import 'package:assignment02_todo_task/data/data_source.dart';
import 'package:assignment02_todo_task/views/widgets/task_widget.dart';
import 'package:flutter/material.dart';

class CompleteTasksScreen extends StatelessWidget {
  Function function;
  CompleteTasksScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount:
            DataSource.tasks.where((element) => element.isComplete).length,
        itemBuilder: (context, index) {
          return TaskWidget(DataSource.tasks
              .where((element) => element.isComplete)
              .toList()[index],function);
        });
  }
}
