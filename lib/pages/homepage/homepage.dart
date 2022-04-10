import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todolist/CustomAppBar.dart';
import 'package:todolist/pages/constants.dart';
import 'package:todolist/pages/todolist_page/todolist_page.dart';
import 'package:todolist/pages/loginpage/login.dart';
import 'package:todolist/widgets/CustomBottomBar.dart';
import 'package:todolist/widgets/TodoListItem.dart';
import 'package:todolist/models/todo.dart';

void main() {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int taks = 0;

class _HomePageState extends State<HomePage> {
  bool ehvdd = false;

  bool setro(bool ehvdd) {
    if (todos.isEmpty) {
      return ehvdd = true;
    }
    return ehvdd;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomBar(
          currentindex: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(4),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tasks',
                      style: GoogleFonts.ubuntu(
                          color: kTextColor2,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TodoListPage()),
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
              if (todos.isEmpty == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No tasks yet',
                      style: GoogleFonts.ubuntu(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: kTextColor2,
                      ),
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (todos.length == 1)
                      Text(
                        'you have ${todos.length} pendent task',
                        style: GoogleFonts.ubuntu(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff769FCE),
                        ),
                      )
                    else
                      Text(
                        'you have ${todos.length} pendent tasks',
                        style: GoogleFonts.ubuntu(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff769FCE),
                        ),
                      ),
                  ],
                ),
              for (Todo todo in todos)
                TodoListItem(
                  todo: todo,
                  deletar: deletar,
                  deletartodos: deletartodos,
                )
            ]),
          ),
        ),
      ),
    );
  }

  void deletartodos() {
    setState(() {
      todos.clear();
    });
  }

  void deletar(Todo todo) {
    setState(() {
      todoPos = todos.indexOf(todo);
      deletedTodo = todo;

      todos.remove(todo);
    });
  }
}
//void main() {
  //  for (int i = 0; i < 5; i++) {
   //     var result = i % 2 == 0 ? print("$i - par") : print("$i - impar");
   // }
//}