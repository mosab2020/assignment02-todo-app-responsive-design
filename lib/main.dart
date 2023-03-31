import 'package:assignment02_todo_task/views/screens/main_tasks_screen.dart';
import 'package:assignment02_todo_task/views/screens/responsivedesign/large_screen.dart';
import 'package:assignment02_todo_task/views/screens/responsivedesign/small_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainTasksScreen()));
}

class ResponsiveTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MediaQuery.of(context).size.width > 400
        ? LargeScreen()
        : SmallScreen();

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Responsive Design'),
    //   ),
    //   body: Container(
    //     height: MediaQuery.of(context).size.height / 2,
    //     width: MediaQuery.of(context).size.width / 2,
    //     color: Colors.red,
    //   ),
    // );
  }
}
