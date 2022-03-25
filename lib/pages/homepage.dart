import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:todolist/pages/todolist_page.dart';
import 'package:todolist/pages/login.dart';

void main() {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _currentindex = 0;
int takscounter = 0;
bool notask = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            setState(() {
              _currentindex = value;
            });
          },
          currentIndex: _currentindex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff769FCE),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Tasks',
              icon: Icon(Icons.task),
            ),
            BottomNavigationBarItem(
              label: 'Focus',
              icon: Icon(Icons.alarm),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, ${usernameController1.text}',
                      style: GoogleFonts.ubuntu(
                          color: Color(0xff769FCE),
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tasks',
                            style: GoogleFonts.ubuntu(
                                color: Color(0xff769FCE),
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TodoListPage()),
                            );
                          },
                          icon: Icon(Icons.add_circle),
                          color: Colors.blue,
                          tooltip: 'New task',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat('MMMM,dd').format(DateTime.now()),
                          style: GoogleFonts.ubuntu(
                            fontSize: 11,
                            color: Color(0xff95a5a6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No tasks yet',
                          style: GoogleFonts.ubuntu(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff769FCE),
                          ),
                        ),
                      ],
                    ),
                    UnDraw(
                        alignment: Alignment.topCenter,
                        illustration: UnDrawIllustration.feeling_blue,
                        semanticLabel: 'None task yet',
                        color: Color(0xff769FCE))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
