import 'package:assignment02_todo_task/views/screens/all_tasks_screen.dart';
import 'package:assignment02_todo_task/views/screens/complete_tasks_screen.dart';
import 'package:assignment02_todo_task/views/screens/incomplete_tasks_screen.dart';
import 'package:flutter/material.dart';

class MainTasksScreen extends StatefulWidget {
  @override
  State<MainTasksScreen> createState() => _MainTasksScreenState();
}

class _MainTasksScreenState extends State<MainTasksScreen> {
  PageController pageController = PageController();

  int pageIndex = 0;

  refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('All Tasks'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>AllTasksScreen(refreshPage)));
                // Navigator.pop(context);
                },
            ),
            ListTile(
              title: const Text('Complete Tasks'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>CompleteTasksScreen(refreshPage)));
              },
            ), ListTile(
              title: const Text('InComplete Tasks'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>InCompleteTasksScreen(refreshPage)));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (v) {
          pageIndex = v;
          pageController.jumpToPage(v);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "All Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: "Complete Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel), label: "InComplete Tasks"),
        ],
      ),
      appBar: AppBar(
        title: Text("ToDo App"),
        actions: [
          ElevatedButton(
              onPressed: () {
                refreshPage();
              },
              child: Text("Test Setstate"))
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          AllTasksScreen(refreshPage),
          CompleteTasksScreen(refreshPage),
          InCompleteTasksScreen(refreshPage)
        ],
      ),
    );
  }
}
