// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../pages/homepage/homepage.dart';
import '../pages/todolist_page/todolist_page.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key, required this.currentindex}) : super(key: key);
  int currentindex;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  get _currentindex => widget.currentindex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color(0xff769FCE),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                },
                icon: Icon(Icons.home),
              )),
          BottomNavigationBarItem(
              label: 'Tasks',
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TodoListPage()));
                },
                icon: Icon(Icons.task_rounded),
              )),
          BottomNavigationBarItem(
            label: 'Focus',
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TodoListPage()));
              },
              icon: Icon(Icons.timelapse_rounded),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.currentindex = index;
    });
  }
}
