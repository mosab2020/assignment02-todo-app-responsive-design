import 'package:assignment02_todo_task/data/data_source.dart';
import 'package:assignment02_todo_task/views/widgets/task_widget.dart';
import 'package:flutter/material.dart';

class AllTasksScreen extends StatelessWidget{
  Function function;
  AllTasksScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemCount: DataSource.tasks.length,itemBuilder: (context,index){
      return TaskWidget(DataSource.tasks[index],function);
    });
  }

}