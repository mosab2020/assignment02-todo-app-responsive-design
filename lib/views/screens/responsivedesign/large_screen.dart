import 'package:flutter/material.dart';

import '../all_tasks_screen.dart';
import '../complete_tasks_screen.dart';
import '../incomplete_tasks_screen.dart';

class LargeScreen extends StatefulWidget {
  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  PageController pageController = PageController();

  int pageIndex = 0;

  refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
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
        body: Row(children: [
          Expanded(
            child: Column(
              children: [
                PageView(
                  controller: pageController,
                  children: [
                    AllTasksScreen(refreshPage),
                    CompleteTasksScreen(refreshPage),
                    InCompleteTasksScreen(refreshPage)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: ListView(
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AllTasksScreen(refreshPage)));
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Complete Tasks'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CompleteTasksScreen(refreshPage)));
                  },
                ),
                ListTile(
                  title: const Text('InComplete Tasks'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                InCompleteTasksScreen(refreshPage)));
                  },
                ),
              ],
            ),
          ))
        ]));

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("ToDo App"),
    //   ),
    //   body: Row(
    //     children: [
    //       Expanded(
    //           child: Column(
    //         children: [
    //           UserAccountsDrawerHeader(
    //               accountName: Text("name"), accountEmail: Text("email"))
    //         ],
    //       )),
    //       Expanded(
    //         child: Center(
    //           child: Text("Screen Body"),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
